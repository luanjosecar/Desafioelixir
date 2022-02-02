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
  def inner(list, start_list, end_list) do
    IO.puts(start_list)
  end

  def main_b do
    a = [1, 2, 3]
    # bubble_sort(a, 0, List.lenth(a))
    IO.puts("item")
    for n <- 0..length(a), do: inner(a, n, length(a))
    # Enum.each(0..length(a), bar(a, ))
  end
end
