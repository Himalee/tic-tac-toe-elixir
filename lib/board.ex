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

  defp convert(number) do
    Enum.to_list 0..number
  end
end
