defmodule TicTacToe do
  def start(length_of_pause_after_move) do
    Display.chosen_game_mode
    |> PlayerFactory.set_players
    |> Game.new(length_of_pause_after_move)
  end
end
