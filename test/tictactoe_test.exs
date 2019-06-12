defmodule TicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest TicTacToe

  setup :start

  defp start(_context) do
    [start: fn -> TicTacToe.start() end]
  end

  test "greets players", context do
    assert capture_io("3\n", context[:start]) =~ "Welcome"
  end

  test "given valid player board size choice, display 3x3 board", context do
    assert capture_io("1\n3\n", context[:start]) =~ "0    1    2  \n  3    4    5  \n  6    7    8  \n"
  end
end
