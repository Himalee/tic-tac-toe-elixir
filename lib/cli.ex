defmodule CLI do
  def welcome_players do
    Console.present(Message.welcome)
  end

  def present_board(grid) do
    grid
    |> BoardFormatter.format
    |> Console.present
  end

  def mark_board(grid, mark, mark_one, mark_two) do
    chosen_move(grid, mark_one, mark_two)
    |> Board.mark(" " <> mark, grid)
  end

  def game_over do
    Console.present(Message.game_over)
  end

  def winning_move(move) do
    Console.present(Message.winner(String.trim(move)))
  end

  def draw do
    Console.present(Message.draw)
  end

  defp chosen_move(grid, mark_one, mark_two) do
    Console.receive(Message.move)
    |> valid_move(grid, mark_one, mark_two)
  end

  defp valid_move(move, grid, mark_one, mark_two) do
    if Validator.is_valid_move?(move, grid, mark_one, mark_two) do
      Validator.to_integer(move)
    else
      chosen_move(grid, mark_one, mark_two)
    end
  end

  def chosen_size_of_board do
    Console.receive(Message.size_of_board)
    |> valid_board_size
  end

  defp valid_board_size(size) do
    if Validator.is_valid_board_size?(size) do
      Validator.to_integer(size)
    else
      chosen_size_of_board()
    end
  end
end
