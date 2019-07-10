defmodule UnbeatableComputerPlayer do
  defstruct [:mark, :length_of_pause_before_move]
end

defimpl Player, for: UnbeatableComputerPlayer do
  def get_mark(unbeatable_computer_player) do
    unbeatable_computer_player.mark
  end

  def get_move(unbeatable_computer_player, grid, mark_one, mark_two) do
    unbeatable_computer_player.length_of_pause_before_move
    |> :timer.sleep
    unbeatable_computer_player
    |> Player.get_mark
    |> Negamax.get_best_move(grid, mark_one, mark_two, 1, unbeatable_computer_player)
  end
end
