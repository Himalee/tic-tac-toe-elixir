defmodule PlayerFactory do
  def set_players(game_mode) do
    if game_mode == 1 do
      [%HumanPlayer{mark: "X"}, %HumanPlayer{mark: "O"}]
    else game_mode == 2
      [%HumanPlayer{mark: "X"}, %RandomComputerPlayer{mark: "O"}]
    end
  end
end
