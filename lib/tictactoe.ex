defmodule TicTacToe do
  def start do
    Display.chosen_game_mode
    |> PlayerFactory.set_players
    |> Game.new
  end
end
