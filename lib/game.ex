defmodule Game do
  def new(players) do
    Display.welcome_players
    create_new_board()
    |> play(players)
  end

  defp create_new_board do
    Display.chosen_size_of_board
    |> Board.new
  end

  defp play(grid, players) do
    Display.present_board(grid)
    if end_of_game?(grid) do
      show_result(grid)
    else
      players
      |> make_move(grid)
      |> Board.mark(current_mark(players), grid)
      |> play(swapped_players(players))
    end
  end

  defp current_player(players) do
    players
    |> Enum.at(0)
  end

  defp current_mark(players) do
    players
    |> current_player
    |> Player.get_mark
  end

  defp opponent_mark(players) do
    players
    |> Enum.at(1)
    |> Player.get_mark
  end

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

  defp end_of_game?(grid) do
    Board.is_there_a_winner?(grid) or Board.is_full?(grid)
  end
end
