defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  test "creates empty 3x3 board" do
    assert length(Board.new(3)) == 9
  end

  test "creates empty 4x4 board" do
    assert length(Board.new(4)) == 16
  end

  test "marks board using index 0" do
    assert Board.mark(0, "X", Board.new(3)) == ["X", 1, 2, 3, 4, 5, 6, 7, 8]
  end

  test "marks board using index 1" do
    assert Board.mark(1, "X", Board.new(3)) == [0, "X", 2, 3, 4, 5, 6, 7, 8]
  end

  test "checks for available moves" do
    assert Board.available_moves([0, "X", 2, 3, "O", "O", "X", "X", 8], "X", "O") == [0, 2, 3, 8]
  end

  test "checks if board is full" do
    assert Board.is_full?([0, "X", 2, 3, "O", "O", "X", "X", 8]) == false
    assert Board.is_full?(["O", "X", "X", "O", "O", "O", "X", "X", "X"]) == true
  end
end
