defmodule Message do
  def welcome do
    "Welcome to Tic Tac Toe"
  end

  def size_of_board do
    "Choose a board size, 3 for 3x3 or 4 for 4x4: "
  end

  def move do
    "Choose a move: "
  end

  def game_over do
    "Game over!"
  end

  def winner(move) do
    "Player " <> move <> " wins!"
  end

  def draw do
    "It's a draw!"
  end

  def game_mode_menu do
    "Pick a game type:\n1. Human vs Human\n2. Human vs Random Computer Player\n3. Human vs Unbeatable Computer Player\n"
  end
end
