defmodule Validator do
  def is_valid_board_size?(size) do
    if is_integer?(size) do
      to_integer(size) == 3 or to_integer(size) == 4
    else
      false
    end
  end

  def is_valid_move?(move, grid, mark_one, mark_two) do
    if is_integer?(move) do
      Enum.member?(Board.available_moves(grid, mark_one, mark_two), to_integer(move))
    else
      false
    end
  end

  def is_valid_game_mode?(game_mode) do
    if is_integer?(game_mode) do
      to_integer(game_mode) == 1 or to_integer(game_mode) == 2
    else
      false
    end
  end

  def to_integer(input) do
    input
    |> String.trim
    |> Integer.parse
    |> elem(0)
  end

  defp is_integer?(input) do
    Regex.match?(~r/^[0-9]+$/, input)
  end
end
