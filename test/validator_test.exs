defmodule ValidatorTest do
  use ExUnit.Case
  doctest Validator

  test "validates board size with invalid input" do
    assert Validator.is_valid_board_size?("22") == false
    assert Validator.is_valid_board_size?("abc") == false
    assert Validator.is_valid_board_size?("44") == false
    assert Validator.is_valid_board_size?("") == false
  end

  test "validates board size with valid input" do
    assert Validator.is_valid_board_size?("3")
    assert Validator.is_valid_board_size?("4\n")
  end

  test "validates move to check whether it is available with invalid input" do
    assert Validator.is_valid_move?("3\n", [0, 1, 2, "X", 4, 5, 6, 7, 8], "X", "O") == false
  end

  test "validates move to check whether it is available with valid input" do
    assert Validator.is_valid_move?("4\n", [0, 1, 2, "X", 4, 5, 6, 7, 8], "X", "O")
  end

  test "validates game mode with invalid input" do
    assert Validator.is_valid_game_mode?("31") == false
    assert Validator.is_valid_game_mode?("hello") == false
    assert Validator.is_valid_game_mode?("2a") == false
    assert Validator.is_valid_game_mode?("") == false
  end

  test "validates game mode with valid input" do
    assert Validator.is_valid_game_mode?("1")
    assert Validator.is_valid_game_mode?("2\n")
  end
end
