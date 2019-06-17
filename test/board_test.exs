defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  test "creates empty 3x3 board" do
    assert length(Board.new(3)) == 9
  end

  test "creates empty 4x4 board" do
    assert length(Board.new(4)) == 16
  end

  test "gets size of board" do
    assert Board.size(Enum.to_list 0..8) == 3
    assert Board.size(Enum.to_list 0..15) == 4
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

  test "gets rows from a 3x3 board" do
    assert Board.rows([0, 1, 2, "X", 4, 5, "O", 7, 8]) == [[0, 1, 2], ["X", 4, 5], ["O", 7, 8]]
  end

  test "gets rows from a 4x4 board" do
    assert Board.rows([0, 1, 2, "X", 4, 5, "O", 7, 8, 9, 10, 11, 12, 13, 14, 15]) == [[0, 1, 2, "X"], [4, 5, "O", 7], [8, 9, 10, 11], [12, 13, 14, 15]]
  end

  test "gets columns from 3x3 board" do
    assert Board.columns([0, 1, 2, "X", 4, 5, "O", 7, 8]) == [[0, "X", "O"], [1, 4, 7], [2, 5, 8]]
  end

  test "gets columns from 4x4 board" do
    assert Board.columns([0, 1, 2, "X", 4, 5, "O", 7, 8, 9, 10, 11, 12, 13, 14, 15]) == [[0, 4, 8, 12], [1, 5, 9, 13], [2, "O", 10, 14], ["X", 7, 11, 15]]
  end

  test "gets diagonals from a 3x3 board" do
    assert Board.diagonals([0, 1, 2, "X", 4, 5, "O", 7, 8]) == [[0, 4, 8], [2, 4, "O"]]
  end

  test "gets diagonals from 4x4 board" do
    assert Board.diagonals([0, 1, 2, "X", 4, 5, "O", 7, 8, 9, 10, 11, 12, 13, 14, 15]) ==  [[0, 5, 10, 15], ["X", "O", 9, 12]]
  end
end
