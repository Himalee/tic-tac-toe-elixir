defmodule Board do
  def new(size) do
    size * size - 1
    |> create_grid
  end

  def mark(index, symbol, grid) do
    List.replace_at(grid, index, symbol)
  end

  def available_moves(grid, mark_one, mark_two) do
    grid
    |> Enum.reject(fn x -> x == mark_one or x == mark_two end)
  end

  def size(grid) do
    grid
    |> length
    |> :math.sqrt
    |> round
  end

  def is_there_a_terminal_state?(grid) do
    is_there_a_winner?(grid) or is_full?(grid)
  end

  def is_full?(grid) do
    length(Enum.uniq(grid)) == 2
  end

  def is_there_a_winner?(grid) do
    grid
    |> Line.all_winning_lines
    |> Enum.any?(fn line -> Line.winning_line?(line) end)
  end

  def winning_move(grid) do
    grid
    |> Line.all_winning_lines
    |> Enum.find(fn line -> Line.winning_line?(line) end)
    |> Enum.uniq
    |> Enum.at(0)
  end

  def random_move(grid, mark_one, mark_two) do
    grid
    |> available_moves(mark_one, mark_two)
    |> Enum.random
  end

  defp create_grid(number) do
    Enum.to_list 0..number
  end
end
