defmodule TicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest TicTacToe

  setup(_context) do
    {:ok, [start: fn -> TicTacToe.start() end]}
  end

  test "greets players", context do
    assert capture_io("3\n0\n1\n2\n3\n4\n5\n6\n7\n8\n", context[:start]) =~ "Welcome"
  end

  test "given valid player board size choice, display 3x3 board", context do
    assert capture_io("3\n0\n1\n2\n3\n4\n5\n6\n7\n8\n", context[:start]) =~ "  0   1   2 \n  3   4   5 \n  6   7   8 \n"
  end

  test "marks board until full", context do
    assert capture_io("3\n0\n1\n2\n3\n4\n5\n6\n7\n8\n", context[:start]) =~ "  X   O   X \n  O   X   O \n  X   O   X \n"
  end
end
