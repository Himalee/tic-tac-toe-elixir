defmodule CLITest do
  use ExUnit.Case
  doctest CLI
  import ExUnit.CaptureIO

  test "welcomes players" do
    assert capture_io(fn ->
      CLI.welcome_players
    end) =~ "Welcome"
  end

 test "presents board" do
    assert capture_io([input: "1\n3\n", capture_prompt: false], fn ->
      IO.write CLI.present_board
    end) == "  0    1    2  \n  3    4    5  \n  6    7    8  \nok"
  end
end
