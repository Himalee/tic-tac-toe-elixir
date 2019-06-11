defmodule TicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest TicTacToe

  test "greets players" do
    execute_main = fn ->
      TicTacToe.start()
    end
    assert capture_io("3\n", execute_main) =~ "Welcome"
  end

  test "given user choice, display 3x3 board" do
    execute_main = fn ->
      TicTacToe.start()
    end
    assert capture_io("3\n", execute_main) =~ "0    1    2  \n  3    4    5  \n  6    7    8  \n"
  end
end
