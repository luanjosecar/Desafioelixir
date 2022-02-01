defmodule Testes do

  def verify_floats(list) do
    if(Enum.all?(list, fn x -> not is_float(x) end)) do
      IO.puts("Erro na leitura")
    else
      IO.puts("Todos os elementos são float")
    end
  end





  def swap(list, pos_a, pos_b) do
    temp = list.
  end

  def bubble_iner(,0,) do :nil
  def bubble_iner(list, end_loop, start_loop \\ 0) do
    if(Enum.at(list,end_loop) > Enum.at(list,end_loop+1))
  end

  def buuble_sort(,,0) do : nil
  def bubble_sort(list, start_list, end_list) do
    if(start_list == end_list) do
      bubble_sort(list,start_list, 0)
    else
      bubble_iner(list, end_list-1-start_list)
      bubble_sort(list, start+1, end_list)
    end


  end

  def hello do
    url = "http://challenge.dienekes.com.br/api/numbers?page=1"

    response = HTTPoison.get!(url)
    req = Poison.decode!(response.body)

    list = req["numbers"]

    verify_floats(list)

    # case HTTPoison.get(url) do
    #   {:ok, %{status_code: 200, body: body}} ->
    #     modelo = Poison.decode!(body)

    #   {:ok, %{status_code: 404}} ->
    #     IO.puts("Erro1")

    #   # do something with a 404

    #   {:error, %{reason: reason}} ->
    #     IO.puts("Erro1")
    #     # do something with an error
    # end
  end
end
