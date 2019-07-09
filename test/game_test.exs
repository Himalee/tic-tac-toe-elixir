defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Game

  setup(_context) do
    {:ok, [
      human_v_human: fn ->
        Game.play(new_grid(3), [%HumanPlayer{mark: "X"},
                               %HumanPlayer{mark: "O"}]) end,
      random_v_random: fn ->
        Game.play(new_grid(3), [%RandomComputerPlayer{mark: "X", length_of_pause_before_move: 0},
                               %RandomComputerPlayer{mark: "O", length_of_pause_before_move: 0}]) end,
      ai_v_ai: fn ->
        Game.play(new_grid(3), [%UnbeatableComputerPlayer{mark: "X", length_of_pause_before_move: 0},
                               %UnbeatableComputerPlayer{mark: "O", length_of_pause_before_move: 0}]) end,
      ai_v_ai_with_4_x_4_board: fn ->
        Game.play(new_grid(4), [%UnbeatableComputerPlayer{mark: "X", length_of_pause_before_move: 0},
                               %UnbeatableComputerPlayer{mark: "O", length_of_pause_before_move: 0}]) end
    ]}
  end

  defp moves_for_win do
    "0\n4\n1\n6\n2"
  end

  defp moves_for_draw do
    "0\n1\n2\n4\n5\n8\n7\n3\n6\n"
  end

  defp new_grid(size) do
    max_size = size * size - 1
    Enum.to_list 0..max_size
  end

  test "marks board until full", context do
    assert capture_io(moves_for_draw(), context[:human_v_human]) =~ "  X   O   X \n  O   O   X \n  X   X   O \n"
  end

  test "marks board until win", context do
    assert capture_io(moves_for_win(), context[:human_v_human]) =~ "  X   X   X \n  3   O   5 \n  O   7   8 \n\nPlayer X wins!\n"
  end

  test "random computer player vs random computer player plays entire game", context do
    assert capture_io("3\n", context[:random_v_random]) =~ "Game over"
  end

  test "unbeatable computer player vs unbeatable computer player plays entire game and draws on a 3x3 board", context do
    assert capture_io("3\n", context[:ai_v_ai]) =~ "draw"
  end

  test "unbeatable computer player vs unbeatable computer player plays entire game and draws on a 4x4 board", context do
    assert capture_io("3\n", context[:ai_v_ai_with_4_x_4_board]) =~ "draw"
  end
end
