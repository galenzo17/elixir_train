defmodule ElixirTrainTest do
  use ExUnit.Case
  doctest ElixirTrain

  test "greets the world" do
    assert ElixirTrain.hello() == :world
  end
end
