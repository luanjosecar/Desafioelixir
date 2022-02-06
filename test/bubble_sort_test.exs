defmodule Desafioelixir.BubbleSortTest do
  use ExUnit.Case
  doctest Desafioelixir

  ## Teste Sort[

  test "test sort" do
    test_list = Enum.take_random(0..15, 15)
    assert Desafioelixir.BubbleSort.bubble_sort(test_list) == Enum.sort(test_list)
    assert Desafioelixir.BubbleSort.bubble_sort([]) == []
  end
end
