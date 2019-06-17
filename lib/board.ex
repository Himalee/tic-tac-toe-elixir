defmodule Board do
  def new(size) do
    size
    |> (fn(x) -> x * x - 1 end).()
    |> convert
  end

  def mark(index, symbol, grid) do
    List.replace_at(grid, index, symbol)
  end

  def available_moves(grid, mark_one, mark_two) do
    grid
    |> Enum.reject(fn x -> x == mark_one or x == mark_two end)
  end

  def is_full?(grid) do
    length(Enum.uniq(grid)) == 2
  end

  def all_winning_lines(grid) do
    rows(grid) ++ columns(grid) ++ diagonals(grid)
  end

  def rows(grid) do
    grid
    |> Enum.chunk_every(size(grid))
  end

  def columns(grid) do
    grid
    |> rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  def diagonals(grid) do
    [diagonal_line([], grid, 0, size(grid) + 1), diagonal_line([], grid, size(grid) - 1, size(grid) - 1)]
  end

  def diagonal_line(line, grid, current_index, increase_index_by) do
    if length(line) == size(grid) do
      line
    else
      line ++ [Enum.at(grid, current_index)]
      |> diagonal_line(grid, current_index + increase_index_by, increase_index_by)
    end
  end

  def size(grid) do
    grid
    |> length
    |> :math.sqrt
    |> round
  end

  defp convert(number) do
    Enum.to_list 0..number
  end
end
