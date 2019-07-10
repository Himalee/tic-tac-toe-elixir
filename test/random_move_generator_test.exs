defmodule RandomMoveGeneratorTest do
  use ExUnit.Case
  doctest RandomMoveGenerator

  test "gets last remaining move on board" do
    grid = ["X", "X", "O", "O", "X", "O", 7, "X", "O"]
    assert RandomMoveGenerator.generate_move(grid, "X", "O") == 7
  end
end
