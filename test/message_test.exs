defmodule MessageTest do
  use ExUnit.Case
  doctest Message

  test "welcome message" do
    assert Message.welcome =~ "Welcome"
  end

  test "prompt player for board size" do
    assert Message.size_of_board =~ "3 for 3x3 or 4 for 4x4"
  end
end
