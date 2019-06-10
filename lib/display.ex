defmodule Display do
  def board(grid) do
    grid
    |> Enum.with_index
    |> Enum.map(&cell/1)
    |> split_grid
    |> Enum.intersperse("\n")
    |> List.flatten
    |> Enum.reduce("", fn str, acc -> acc <> str end)
  end

  defp cell(tuple) when elem(tuple, 1) > 9, do: "  #{elem(tuple, 0)} "
  defp cell(tuple) when true, do: "  #{elem(tuple, 0)}  "

  defp split_grid(grid) do
    Enum.chunk_every(grid, size(grid))
  end

  defp size(grid) do
    grid
    |> length
    |>:math.sqrt
    |> round
  end
end
