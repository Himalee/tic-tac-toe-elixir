defmodule ValidatorTest do
  use ExUnit.Case
  doctest Validator

  test "validates board size" do
    assert Validator.is_valid_board_size?("abc\n") == false
    assert Validator.is_valid_board_size?("22\n") == false
    assert Validator.is_valid_board_size?("3\n") == true
    assert Validator.is_valid_board_size?("4\n") == true
  end
end
