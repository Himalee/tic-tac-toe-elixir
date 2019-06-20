defmodule RandomComputerPlayer do
  defstruct [:mark]
end

defimpl Player, for: RandomComputerPlayer do
  def get_move(_random_computer_player, grid, mark_one, mark_two) do
    Board.random_move(grid, mark_one, mark_two)
  end

  def get_mark(random_player) do
    random_player.mark
  end
end
