defmodule ValidatorTest do
  use ExUnit.Case
  doctest Validator

  test "validates board size" do
    assert Validator.is_valid_board_size?("22") == false
    assert Validator.is_valid_board_size?("abc") == false
    assert Validator.is_valid_board_size?("44") == false
    assert Validator.is_valid_board_size?("3") == true
    assert Validator.is_valid_board_size?("4\n") == true
  end

  test "validates move to check whether it is available" do
    assert Validator.is_valid_move?("3\n", [0, 1, 2, "X", 4, 5, 6, 7, 8], "X", "O") == false
    assert Validator.is_valid_move?("4\n", [0, 1, 2, "X", 4, 5, 6, 7, 8], "X", "O") == true
  end
end
