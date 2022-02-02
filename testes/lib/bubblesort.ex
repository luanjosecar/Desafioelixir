defmodule BubbleSort do
  # def bubble_iner(list, end_loop, start_loop \\ 0) do
  #   if(Enum.at(list, end_loop) > Enum.at(list, end_loop + 1))
  # end

  # def bubble_sort(list, start_list, end_list) do
  #   if(start_list == end_list) do
  #     bubble_sort(list, start_list, 0)
  #   else
  #     bubble_iner(list, end_list - 1 - start_list)
  #     bubble_sort(list, start + 1, end_list)
  #   end
  # end

  def swap(list, item_a, item_b) do
    value_1 = Enum.fetch!(list, item_a)
    value_2 = Enum.fetch!(list, item_b)
    # IO.write(value_1)
    # IO.write(" ")
    # IO.puts(value_2)

    if value_1 > value_2 do
      list
      |> List.replace_at(item_a, value_2)
      |> List.replace_at(item_b, value_1)
    else
      list
    end
  end

  def inner(list, end_list) do
    for x <- 0..(end_list - 1), do: list = swap(list, x, x + 1)
    # for x <- 0..(end_list - 1), do: IO.puts(Enum.fetch!(list, x))
  end

  def bubble_sort(list) do
    for n <- 0..(length(list) - 1), do: inner(list, n)
  end

  def bsort(list) when is_list(list) do
    t = bsort_iter(list)

    if t == list, do: t, else: bsort(t)
  end

  def bsort_iter([x, y | t]) when x > y, do: [y | bsort_iter([x | t])]
  def bsort_iter([x, y | t]), do: [x | bsort_iter([y | t])]
  def bsort_iter(list), do: list

  def main_b do
    list = [1, 6, 2, 7, 23, 6, 1, 7, 24, 12, 6]
    # bubble_sort(a, 0, List.lenth(a))

    # for n <- 0..length(a), do: inner(a, n, length(a))
    # Enum.each(0..length(a), bar(a, ))
    # list = bubble_sort(list)

    a = bsort(list)
    IO.inspect(a)
  end
end
