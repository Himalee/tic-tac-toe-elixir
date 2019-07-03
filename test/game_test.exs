defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Game

  setup(_context) do
    {:ok, [
      humanvhuman: fn ->  Game.new([%HumanPlayer{mark: "X"},  %HumanPlayer{mark: "O"}]) end,
      randomvrandom: fn -> Game.new([%RandomComputerPlayer{mark: "X", length_of_pause_before_move: 0},  %RandomComputerPlayer{mark: "O", length_of_pause_before_move: 0}]) end,
      aivsai: fn -> Game.new([%UnbeatableComputerPlayer{mark: "X", length_of_pause_before_move: 0},  %UnbeatableComputerPlayer{mark: "O", length_of_pause_before_move: 0}]) end
    ]}
  end

  defp moves_for_win do
    "3\n0\n4\n1\n6\n2"
  end

  defp moves_for_draw do
    "3\n0\n1\n2\n4\n5\n8\n7\n3\n6\n"
  end

  test "greets players", context do
    assert capture_io(moves_for_draw(), context[:humanvhuman]) =~ "Welcome"
  end

  test "given valid player board size choice, display 3x3 board", context do
    assert capture_io(moves_for_draw(), context[:humanvhuman]) =~ "  0   1   2 \n  3   4   5 \n  6   7   8 \n"
  end

  test "marks board until full", context do
    assert capture_io(moves_for_draw(), context[:humanvhuman]) =~ "  X   O   X \n  O   O   X \n  X   X   O \n"
  end

  test "marks board until win", context do
    assert capture_io(moves_for_win(), context[:humanvhuman]) =~ "  X   X   X \n  3   O   5 \n  O   7   8 \n\nPlayer X wins!\n"
  end

  test "random computer player vs random computer player plays entire game", context do
    assert capture_io("3\n", context[:randomvrandom]) =~ "Game over"
  end

  test "unbeatable computer player vs unbeatable computer player plays entire game and draws", context do
    assert capture_io("3\n", context[:aivsai]) =~ "draw"
  end
end
