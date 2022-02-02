defmodule Testes do
  def verify_floats(list) do
    if(Enum.all?(list, fn x -> not is_float(x) end)) do
      IO.puts("Erro na leitura")
    else
      IO.puts("Todos os elementos são float")
    end
  end

  def main do
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
