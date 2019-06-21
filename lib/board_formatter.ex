defmodule BoardFormatter do
  def format(grid) do
    grid
    |> insert_spacing
    |> format_with_index
    |> create_rows
    |> convert_to_presentable_format
  end

  defp insert_spacing(grid) do
    grid
    |> Enum.map(fn x -> if is_binary(x), do: " " <> x, else: x end)
  end

  defp format_with_index(grid) do
    grid
    |> Enum.with_index
    |> Enum.map(&cell/1)
  end

  def cell(tuple) do
    single_digit_numbers = Enum.to_list 0..9
    if Enum.member?(single_digit_numbers, elem(tuple, 0)) do
      "  #{elem(tuple, 0)} "
    else
      " #{elem(tuple, 0)} "
    end
  end

  defp create_rows(grid) do
    grid
    |> Enum.chunk_every(Board.size(grid))
    |> Enum.intersperse("\n")
    |> List.flatten
  end

  defp convert_to_presentable_format(grid) do
    grid
    |> Enum.reduce("", fn str, acc -> acc <> str end)
  end
end
