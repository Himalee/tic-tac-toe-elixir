defmodule DisplayTest do
  use ExUnit.Case
  doctest Display
  import ExUnit.CaptureIO

  test "welcomes players" do
    assert capture_io(fn ->
      Display.welcome_players
    end) =~ "Welcome"
  end

 test "presents board" do
    assert capture_io([input: "1\n3\n", capture_prompt: false], fn ->
      IO.write Display.present_board([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end) == "  0   1   2 \n  3   4   5 \n  6   7   8 \nok"
  end

  test "gets valid human player move" do
    assert capture_io([input: "1\n2\n", capture_prompt: false], fn ->
      IO.write Display.chosen_move([0, "X", 2, 3, 4, 5, 6, 7, 8], "X","O")
    end) == "2"
  end

  test "display winning move message" do
    assert capture_io(fn ->
      Display.winning_move("X")
    end) == "Player X wins!\n"
  end

  test "gets valid game mode" do
    assert capture_io([input: "a\n8\n2\n", capture_prompt: false], fn ->
      IO.write Display.chosen_game_mode
    end) == "2"
  end
end
