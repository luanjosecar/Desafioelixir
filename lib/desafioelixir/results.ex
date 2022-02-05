defmodule Desafioelixir.Results do
  use GenServer
  alias Desafioelixir.Requests
  alias Desafioelixir.BubbleSort

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :base_list)
  end

  def get_lista do
    GenServer.call(:base_list, :get_lista)
  end

  def add_list(lista) do
    GenServer.cast(:base_list, {:add_lista, lista})
  end

  def init(lista) do
    list = create_list()
    {:ok, list}
  end

  def handle_call(:get_lista, _form, lista) do
    {:reply, lista, lista}
  end

  def handle_cast({:add_lista, list}, lista) do
    {:noreply, [list]}
  end

  def create_list do
    list = Requests.make_request(9999)
    IO.puts("Realizando Sort")
    list = BubbleSort.bubble_sort(list)
    add_list(list)
  end
end
