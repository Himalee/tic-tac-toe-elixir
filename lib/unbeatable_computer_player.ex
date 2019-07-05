defmodule UnbeatableComputerPlayer do
  defstruct [:mark, :length_of_pause_before_move]
end

defimpl Player, for: UnbeatableComputerPlayer do
  def get_mark(random_player) do
    random_player.mark
  end

  def get_move(unbeatable_computer_player, grid, mark_one, mark_two) do
    unbeatable_computer_player.length_of_pause_before_move
    |> :timer.sleep
    unbeatable_computer_player
    |> Player.get_mark
    |> get_best_move(grid, mark_one, mark_two, 1)
  end

  defp get_best_move(current_mark, grid, mark_one, mark_two, depth) do
    grid
    |> available_moves(mark_one, mark_two)
    |> Enum.reduce(%{}, fn move, acc ->
      next_grid = Board.mark(move, current_mark, grid)
      score = get_score(next_grid, current_mark, mark_one, mark_two, depth)
      Map.put(acc, move, score)
    end)
    |> pick_best_move_or_highest_score(depth)
  end

  defp available_moves(grid, mark_one, mark_two) do
    grid
    |> Board.available_moves(mark_one, mark_two)
  end

  defp get_score(grid, current_mark, mark_one, mark_two, depth) do
    score =
      if Board.is_there_a_terminal_state?(grid) do
        score(grid, depth)
      else
        switch_marks(current_mark, mark_one, mark_two)
        |> get_best_move(grid, mark_one, mark_two, depth + 1)
      end
    score * -1
  end

  defp pick_best_move_or_highest_score(scores, depth) do
    if depth == 1 do
      max = get_max_score(scores)
      Enum.reject(scores, fn {move, score} -> if score != max, do: move end)
      |> Enum.at(0)
      |> elem(0)
    else
      scores
      |> get_max_score
    end
  end

  defp get_max_score(scores) do
    scores
    |> Enum.map(fn {_move, score} -> score end)
    |> Enum.max
  end

  defp score(grid, depth) do
    cond do
      Board.is_there_a_winner?(grid) -> -round(1000/depth)
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
