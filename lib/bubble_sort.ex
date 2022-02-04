defmodule BubbleSort do
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

  def main_b do
    list = [1, 6, 2, 7, 23, 6, 1, 7, 24, 12, 6]
    # bubble_sort(a, 0, List.lenth(a))

    # Enum.each(0..length(a), bar(a, ))
    b = bubble_sort(list)

    IO.inspect(b)
  end
end
