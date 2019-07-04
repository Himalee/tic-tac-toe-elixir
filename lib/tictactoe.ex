defmodule TicTacToe do
  def start do
    Display.welcome_players
    Game.play(create_new_board(), set_up_players())
  end

  defp set_up_players do
    Display.chosen_game_mode
    |> PlayerFactory.set_players
  end

  defp create_new_board do
    Display.chosen_size_of_board
    |> Board.new
  end
end
