defmodule RandomComputerPlayer do
  defstruct [:mark]
end

defimpl Player, for: RandomComputerPlayer do
  def get_move(_random_computer_player, grid) do
    Board.random_move(grid, "X", "O")
  end
end
