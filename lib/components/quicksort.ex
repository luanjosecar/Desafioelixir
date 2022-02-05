defmodule Desafioelixir.Qsort do
  # base case for qsort
  def qsort([]), do: []
  # base case for qsort
  def qsort([pivot | []]), do: [pivot]
  # how to get head and tail from
  def qsort([pivot | tail]) do
    # How to filter
    lower = Enum.filter(tail, fn n -> n < pivot end)
    higher = Enum.filter(tail, fn n -> n > pivot end)

    qsort(lower) ++ [pivot] ++ qsort(higher)
  end
end
