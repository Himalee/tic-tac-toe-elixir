defmodule TicTacToe do
  def start do
    welcome_players()
    chosen_size_of_board()
    |> convert_size_of_board
    |> display_board
  end

  def welcome_players do
    IO.puts(Message.welcome)
  end

  defp chosen_size_of_board do
    IO.gets(Message.size_of_board)
  end

  defp convert_size_of_board(user_choice) do
    user_choice
    |> String.trim
    |> Integer.parse
    |> elem(0)
  end

  defp display_board(size) do
    size
    |> Board.new
    |> Display.board
    |> IO.puts
  end
end
