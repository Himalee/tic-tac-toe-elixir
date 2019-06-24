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
    assert Board.is_full?(["O", "X", "X", "O", "O", "O", "X", "X", "X"])
  end

  test "checks if board is not full" do
    assert Board.is_full?([0, "X", 2, 3, "O", "O", "X", "X", 8]) == false
  end

  test "checks if there is a win" do
    assert Board.is_there_a_winner?(["X", "X", "X", 3, 4, 5, "O", 7, 8])
    assert Board.is_there_a_winner?([0, 1, 2, "X", 4, 5, "O", "O", "O"])
    assert Board.is_there_a_winner?([0, 1, "?", "X", "?", 5, "?", "O", "O"])
    assert Board.is_there_a_winner?(["O", 1, 2, "O", 4, 5, "O", "X", "X"])
  end

  test "checks if there is no win" do
    assert Board.is_there_a_winner?([0, 1, 2, "X", 4, 5, "O", 7, 8]) == false
  end

  test "winning move" do
    assert Board.winning_move(["X", "X", "X", 3, 4, 5, "O", 7, 8]) == "X"
    assert Board.winning_move([0, 1, "!", 3, 4, "!", 6, 7, "!"]) == "!"
  end

  test "gets random move from available moves" do
    assert Board.random_move(["X", 1], "X", "O") == 1
    assert Board.random_move(["X", 1, 2], "X", "O") == 1 or 2
  end

  test "marks board with random move" do
    random_move = Board.random_move(["O", 1], "X", "O")
    assert Board.mark(random_move, "X", ["O", 1]) == ["O", "X"]
  end
end
