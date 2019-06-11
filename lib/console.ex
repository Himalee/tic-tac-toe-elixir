defmodule Console do
  def present(message) do
    IO.puts message
  end

  def receive(prompt) do
    IO.gets(prompt)
  end
end
