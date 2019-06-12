defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  test "creates empty 3x3 board" do
    assert length(Board.new(3)) == 9
  end

  test "creates empty 4x4 board" do
    assert length(Board.new(4)) == 16
  end
end
