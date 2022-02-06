defmodule Desafioelixir.Results do
  use GenServer
  alias Desafioelixir.Requests
  alias Desafioelixir.BubbleSort
  alias Desafioelixir.Validation

  @request Application.get_env(:desafioelixir, :requests) || 9999
  @port Application.get_env(:desafioelixir, :port)
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
    IO.puts("Iniciando Requests da plataforma na página #{@request}")
    list = Requests.make_request(@request)
    IO.puts("Requisições finalizadas")
    IO.puts("Realizando Sort da Lista obtida")
    list = BubbleSort.bubble_sort(list)
    if Validation.verify_floats(list) == true, do: add_list(list)
    IO.puts("Starting server at http://localhost:#{@port}/")
  end
end
