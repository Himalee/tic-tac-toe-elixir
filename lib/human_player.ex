defmodule HumanPlayer do
  defstruct [:move]
end

defimpl Player, for: HumanPlayer do
  def get_move(human_player), do: human_player.move
end
