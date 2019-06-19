defmodule HumanPlayer do
  defstruct [:move]
  def move(grid) do
    CLI.chosen_move(grid,"X", "O")
  end
end

defimpl Player, for: HumanPlayer do
  def get_move(human_player), do: human_player.move
end
