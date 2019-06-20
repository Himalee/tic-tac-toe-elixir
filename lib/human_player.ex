defmodule HumanPlayer do
  defstruct [:mark]
end

defimpl Player, for: HumanPlayer do
  def get_move(_human_player, grid) do
    CLI.chosen_move(grid, "X", "O")
  end

  def get_mark(human_player) do
    human_player.mark
  end
end
