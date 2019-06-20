defprotocol Player do
  def get_move(player, grid, mark_one, mark_two)
  def get_mark(player)
end
