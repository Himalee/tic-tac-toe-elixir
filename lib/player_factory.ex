defmodule PlayerFactory do
  def set_players(game_mode) when game_mode == 1, do: [%HumanPlayer{mark: "X"}, %HumanPlayer{mark: "O"}]
  def set_players(game_mode) when game_mode == 2, do: [%HumanPlayer{mark: "X"}, %RandomComputerPlayer{mark: "O"}]
  def set_players(game_mode) when game_mode == 3, do: [%HumanPlayer{mark: "X"}, %UnbeatableComputerPlayer{mark: "O"}]
end
