defmodule PlayerFactory do
  def set_players(game_mode) do
    cond do
      game_mode == 1 -> [%HumanPlayer{mark: "X"}, %HumanPlayer{mark: "O"}]
      game_mode == 2 -> [%HumanPlayer{mark: "X"}, %RandomComputerPlayer{mark: "O"}]
      game_mode == 3 -> [%HumanPlayer{mark: "X"}, %UnbeatableComputerPlayer{mark: "O"}]
    end
  end
end
