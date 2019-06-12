defmodule ConsoleTest do
  use ExUnit.Case
  doctest Console
  import ExUnit.CaptureIO

  test "presents output" do
    assert capture_io(fn ->
      Console.present("hello")
    end) == "hello\n"
  end

 test "gets input" do
    assert capture_io([input: "world", capture_prompt: false], fn ->
      IO.write Console.receive("hello?")
    end) == "world"
  end
end
