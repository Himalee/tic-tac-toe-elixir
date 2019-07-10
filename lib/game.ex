defmodule Game do
  def play(grid, players) do
    Display.present_board(grid)
    if Board.is_there_a_terminal_state?(grid) do
      show_result(grid)
    else
      players
      |> make_move(grid)
      |> Board.mark(current_mark(players), grid)
      |> play(swapped_players(players))
    end
  end

  defp current_player(players), do: Enum.at(players, 0)
  defp opponent_mark([_, opponent]), do: Player.get_mark(opponent)
  defp current_mark([current, _]), do: Player.get_mark(current)

  defp make_move(players, grid) do
    players
    |> current_player
    |> Player.get_move(grid, current_mark(players), opponent_mark(players))
  end

  defp swapped_players(players) do
    players
    |> Enum.reverse
  end

  defp show_result(grid) do
    if Board.is_there_a_winner?(grid) do
      Board.winning_move(grid)
      |> Display.winning_move
    else
      Display.draw
    end
    Display.game_over
  end
end
