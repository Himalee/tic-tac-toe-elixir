defmodule TicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest TicTacToe

  setup(_context) do
    {:ok, [start: fn -> TicTacToe.start() end]}
  end

  defp moves_for_win do
    "3\n0\n4\n1\n6\n2"
  end

  defp moves_for_draw do
    "3\n0\n1\n2\n4\n5\n8\n7\n3\n6\n"
  end
  test "greets players", context do
    assert capture_io(moves_for_draw(), context[:start]) =~ "Welcome"
  end

  test "given valid player board size choice, display 3x3 board", context do
    assert capture_io(moves_for_draw(), context[:start]) =~ "  0   1   2 \n  3   4   5 \n  6   7   8 \n"
  end

  test "marks board until full", context do
    assert capture_io(moves_for_draw(), context[:start]) =~ "  X   O   X \n  O   O   X \n  X   X   O \n"
  end

  test "marks board until win", context do
    assert capture_io(moves_for_win(), context[:start]) =~ "  X   X   X \n  3   O   5 \n  O   7   8 \n"
  end
end
