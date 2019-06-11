defmodule BoardFormatter do
  def format(grid) do
    grid
    |> format_with_index
    |> create_rows
    |> convert_to_presentable_format
  end

  defp format_with_index(grid) do
    grid
    |> Enum.with_index
    |> Enum.map(&cell/1)
  end

  defp cell(tuple) when elem(tuple, 1) > 9, do: "  #{elem(tuple, 0)} "
  defp cell(tuple) when true, do: "  #{elem(tuple, 0)}  "

  defp create_rows(grid) do
    grid
    |> Enum.chunk_every(size(grid))
    |> Enum.intersperse("\n")
    |> List.flatten
  end

  defp convert_to_presentable_format(grid) do
    grid
    |> Enum.reduce("", fn str, acc -> acc <> str end)
  end

  defp size(grid) do
    grid
    |> length
    |>:math.sqrt
    |> round
  end
end
