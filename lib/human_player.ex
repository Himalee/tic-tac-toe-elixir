defmodule HumanPlayer do
  defstruct [:mark]
end

defimpl Player, for: HumanPlayer do
  def get_move(_human_player, grid, mark_one, mark_two) do
    Display.chosen_move(grid, mark_one, mark_two)
  end

  def get_mark(human_player) do
    human_player.mark
  end
end
