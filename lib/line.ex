defmodule Line do
  def all_winning_lines(grid) do
    rows(grid) ++ columns(grid) ++ diagonals(grid)
  end

  def winning_line?(line) do
    length(Enum.uniq(line)) == 1
  end

  def contains_three_of_the_same_mark?(lines) do
    lines
    |> Enum.any?(fn line -> Enum.count(Enum.uniq(line)) == 2 end)
  end

  defp rows(grid) do
    grid
    |> Enum.chunk_every(Board.size(grid))
  end

  defp columns(grid) do
    grid
    |> rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  defp diagonals(grid) do
    [diagonal_line([], grid, 0, Board.size(grid) + 1), diagonal_line([], grid, Board.size(grid) - 1, Board.size(grid) - 1)]
  end

  defp diagonal_line(line, grid, current_index, increase_index_by) do
    if length(line) == Board.size(grid) do
      line
    else
      line ++ [Enum.at(grid, current_index)]
      |> diagonal_line(grid, current_index + increase_index_by, increase_index_by)
    end
  end
end
