defmodule UnbeatableComputerPlayerTest do
  use ExUnit.Case
  doctest UnbeatableComputerPlayer

  test "returns last remaining move which results in a win" do
    grid = ["X", "X", 2, "O", "O", "X", "X", "O", "O"]
    unbeatable_computer_player = %UnbeatableComputerPlayer{mark: "X", length_of_pause_before_move: 0}
    assert Player.get_move(unbeatable_computer_player, grid, "X", "O") == 2
  end

  test "returns last remaining move" do
    grid = ["X", "O", "X", "O", "O", "X", 6, "X", "O"]
    unbeatable_computer_player = %UnbeatableComputerPlayer{mark: "X", length_of_pause_before_move: 0}
    assert Player.get_move(unbeatable_computer_player, grid, "X", "O") == 6
  end

  test "returns move given board with 3 possible moves" do
    grid = ["X", 1, "X", "O", "O", "X", 6, 7, "O"]
    unbeatable_computer_player = %UnbeatableComputerPlayer{mark: "X", length_of_pause_before_move: 0}
    assert Player.get_move(unbeatable_computer_player, grid, "X", "O") == 1
  end

  test "returns move given board with 5 possible moves" do
    grid = ["O", "X", 2, 3, 4, 5, 6, "X", "O"]
    unbeatable_computer_player = %UnbeatableComputerPlayer{mark: "X", length_of_pause_before_move: 0}
    assert Player.get_move(unbeatable_computer_player, grid, "X", "O") == 4
  end

  test "returns move given board with 5 possible moves - trap move" do
    grid = ["O", 1, 2, 3, "X", "O", 6, 7, "X"]
    unbeatable_computer_player = %UnbeatableComputerPlayer{mark: "X", length_of_pause_before_move: 0}
    assert Player.get_move(unbeatable_computer_player, grid, "X", "O") == 6 or 2
  end

  test "returns move given board to stop opponent 'O' from winning" do
    grid = ["O", "X", 2, 3, "X", 5, 6, 7, 8]
    unbeatable_computer_player = %UnbeatableComputerPlayer{mark: "O", length_of_pause_before_move: 0}
    assert Player.get_move(unbeatable_computer_player, grid, "X", "O") == 7
  end

  test "returns last remaining move which results in a win on a 4x4 board" do
    grid = ["X", "X", 2, "O", "O", "O", "X", "O", "X", "O", "X", "O", "O", "X", "O", "X"]
    unbeatable_computer_player = %UnbeatableComputerPlayer{mark: "X", length_of_pause_before_move: 0}
    assert Player.get_move(unbeatable_computer_player, grid, "X", "O") == 2
  end

  test "returns move that results in a win on a 4x4 board with less than 8 moves remaining" do
    grid = ["X", "X", 2, "X", "O", "O", 6, "X", "O", "O", 10, 11, 12, 13, 14, 15]
    unbeatable_computer_player = %UnbeatableComputerPlayer{mark: "X", length_of_pause_before_move: 0}
    assert Player.get_move(unbeatable_computer_player, grid, "X", "O") == 2
  end

  test "returns move that results in a win on a 4x4 board with 8 moves remaining" do
    grid = ["X", "X", 2, "X", "O", "O", 6, "X", "O", "O", 10, 11, 12, 13, 14, 15]
    unbeatable_computer_player = %UnbeatableComputerPlayer{mark: "X", length_of_pause_before_move: 0}
    assert Player.get_move(unbeatable_computer_player, grid, "X", "O") == 2
  end

  test "returns move that results in a win on a 4x4 board with 10 moves remaining" do
    grid = ["X", "X", 2, "X", "O", "O", 6, 7, 8, "O", 10, 11, 12, 13, 14, 15]
    unbeatable_computer_player = %UnbeatableComputerPlayer{mark: "X", length_of_pause_before_move: 0}
    assert Player.get_move(unbeatable_computer_player, grid, "X", "O") == 2
  end

  test "returns move that blocks opponent from winning on a 4x4 board with 10 moves remaining" do
    grid = ["X", "X", 2, "X", "O", "O", 6, 7, 8, "O", 10, 11, 12, 13, 14, 15]
    unbeatable_computer_player = %UnbeatableComputerPlayer{mark: "O", length_of_pause_before_move: 0}
    assert Player.get_move(unbeatable_computer_player, grid, "X", "O") == 2
  end
end
