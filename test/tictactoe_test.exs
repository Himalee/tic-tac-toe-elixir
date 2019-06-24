defmodule TicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest TicTacToe

  setup(_context) do
    {:ok, [start: fn -> TicTacToe.start(0) end]}
  end

  defp moves_for_win do
    "1\n3\n0\n4\n1\n6\n2"
  end

  test "sets up and plays a human vs human game", context do
    assert capture_io(moves_for_win(), context[:start]) =~ "  X   X   X \n  3   O   5 \n  O   7   8 \n"
  end
end
