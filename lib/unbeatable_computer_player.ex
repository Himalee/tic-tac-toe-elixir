defmodule UnbeatableComputerPlayer do
  defstruct [:mark, :length_of_pause_before_move]
end

defimpl Player, for: UnbeatableComputerPlayer do
  def get_mark(unbeatable_computer_player) do
    unbeatable_computer_player.mark
  end

  def get_move(unbeatable_computer_player, grid, mark_one, mark_two) do
    unbeatable_computer_player.length_of_pause_before_move
    |> :timer.sleep
    unbeatable_computer_player
    |> Player.get_mark
    |> get_best_move(grid, mark_one, mark_two, 1, unbeatable_computer_player)
  end

  defp get_best_move(current_mark, grid, mark_one, mark_two, depth, unbeatable_computer_player) do
    case number_of_available_moves(grid, mark_one, mark_two) do
      available_moves when available_moves > 9 -> get_best_move(grid, mark_one, mark_two)
      _ ->
        grid
        |> available_moves(mark_one, mark_two)
        |> Enum.reduce(%{}, fn move, acc ->
          next_grid = Board.mark(move, current_mark, grid)
          next_score = get_score(next_grid, current_mark, mark_one, mark_two, depth, unbeatable_computer_player)
          Map.put(acc, move, next_score)
        end)
        |> pick_best_move_or_highest_score(depth)
    end
  end

  defp get_best_move(grid, mark_one, mark_two) do
    all_lines = Board.all_winning_lines(grid)
    if line_contains_three_of_the_same_mark?(all_lines) do
      get_move_to_win_or_block(all_lines, mark_one, mark_two)
    else
      Board.random_move(grid, mark_one, mark_two)
    end
  end

  defp number_of_available_moves(grid, mark_one, mark_two) do
    available_moves(grid, mark_one, mark_two)
    |> Enum.count
  end

  defp get_move_to_win_or_block(lines, mark_one, mark_two) do
    lines
    |> Enum.find(fn line -> Enum.count(Enum.uniq(line)) == 2 end)
    |> Enum.drop_while(fn x -> x == mark_one or x == mark_two end)
    |> Enum.at(0)
  end

  defp line_contains_three_of_the_same_mark?(lines) do
    lines
    |> Enum.any?(fn line -> Enum.count(Enum.uniq(line)) == 2 end)
  end

  defp available_moves(grid, mark_one, mark_two) do
    grid
    |> Board.available_moves(mark_one, mark_two)
  end

  defp get_score(grid, current_mark, mark_one, mark_two, depth, unbeatable_computer_player) do
    score =
      if Board.is_there_a_terminal_state?(grid) do
        score(grid, depth)
      else
        switch_marks(current_mark, mark_one, mark_two)
        |> get_best_move(grid, mark_one, mark_two, depth + 1, unbeatable_computer_player)
      end
    -score
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
