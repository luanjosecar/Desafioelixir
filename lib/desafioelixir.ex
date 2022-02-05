defmodule Desafioelixir do
  alias Desafioelixir.Requests
  alias Desafioelixir.BubbleSort

  def main do
    list = Requests.make_request(9990)
    IO.puts("Realizando Sort")
    list = BubbleSort.bubble_sort(list)

    IO.inspect(list)
  end
end
