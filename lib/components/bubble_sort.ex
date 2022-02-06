defmodule Desafioelixir.BubbleSort do
  def bubble_sort(list) do
    aux = bubble_inner(list)

    if aux == list, do: aux, else: bubble_sort(aux)
  end

  def bubble_inner([value_a, value_b | temp_list]) do
    if value_a > value_b do
      [value_b | bubble_sort([value_a | temp_list])]
    else
      [value_a | bubble_sort([value_b | temp_list])]
    end
  end

  def bubble_inner(list), do: list
end
