defmodule TicTacToeTest do
  use ExUnit.Case
  doctest TicTacToe

  test "greets players" do
    assert TicTacToe.start() == :ok
  end
end
