defprotocol Player do
  def get_move(player, grid, mark_one, mark_two, length_of_pause_after_move)
  def get_mark(player)
end
