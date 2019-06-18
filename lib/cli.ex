defmodule CLI do
  def welcome_players do
    Console.present(Message.welcome)
  end

  def present_board(grid) do
    grid
    |> BoardFormatter.format
    |> Console.present
  end

  def game_over do
    Console.present(Message.game_over)
  end

  def winning_move(move) do
    move
    |> String.trim
    |> Message.winner
    |> Console.present
  end

  def draw do
    Console.present(Message.draw)
  end

  def chosen_move(grid, mark_one, mark_two) do
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
