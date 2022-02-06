defmodule Desafioelixir.ValidationTest do
  use ExUnit.Case
  doctest Desafioelixir

  ## Teste Sort

  test "test list" do
    test_list = Enum.take_random(0..15, 15)
    assert Desafioelixir.Validation.verify_floats(test_list) == false
    assert Desafioelixir.Validation.verify_floats([]) == false
  end
end
