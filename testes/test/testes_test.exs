defmodule TestesTest do
  use ExUnit.Case
  doctest Testes

  test "greets the world" do
    assert Testes.hello() == :world
  end
end
