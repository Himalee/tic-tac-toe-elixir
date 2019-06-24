defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(_) do
    TicTacToe.start(1000)
  end
end
