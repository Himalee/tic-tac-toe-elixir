defmodule UnbeatableComputerPlayer do
  defstruct [:mark, :length_of_pause_before_move]
end

defimpl Player, for: UnbeatableComputerPlayer do
  def get_mark(random_player) do
    random_player.mark
  end

  def get_move(unbeatable_computer_player, grid, mark_one, mark_two) do
    unbeatable_computer_player
    |> Player.get_mark
    |> get_best_move(grid, mark_one, mark_two, 0)
  end

  defp get_best_move(current_mark, grid, mark_one, mark_two, depth) do
    grid
    |> available_moves(mark_one, mark_two)
    |> Enum.map(fn move ->
        move
        |> Board.mark(current_mark, grid)
        |> get_score(current_mark, mark_one, mark_two, depth)
    end)
    |> pick_best_move_or_highest_score(depth, available_moves(grid, mark_one, mark_two))
  end

  defp available_moves(grid, mark_one, mark_two) do
    grid
    |> Board.available_moves(mark_one, mark_two)
  end

  defp get_score(grid, current_mark, mark_one, mark_two, depth) do
    score =
      if is_there_a_terminal_state?(grid) do
        score(grid)
      else
        switch_marks(current_mark, mark_one, mark_two)
        |> get_best_move(grid, mark_one, mark_two, depth + 1)
      end
    score * -1
  end

  defp pick_best_move_or_highest_score(scores, depth, available_moves) do
    if depth == 0 do
      max_score = Enum.max(scores)
      index_of_best_score = Enum.find_index(scores, fn x -> x == max_score end)
      Enum.at(available_moves, index_of_best_score)
    else
      Enum.max(scores)
    end
  end

  defp is_there_a_terminal_state?(grid) do
    Board.is_there_a_winner?(grid) or Board.is_full?(grid)
  end

  defp score(grid) do
    cond do
      Board.is_there_a_winner?(grid) -> -1
      Board.is_full?(grid) -> 0
    end
  end

  defp switch_marks(current_mark, mark_one, mark_two) do
    if current_mark == mark_one do
      mark_two
    else
      mark_one
    end
  end
end
