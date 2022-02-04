defmodule Testes do
  def verify_floats(list) do
    if(Enum.all?(list, fn x -> not is_float(x) end)) do
      IO.puts("Erro na leitura")
    else
      IO.puts("Todos os elementos são float")
    end
  end

  def testeLista(lista) do
    List.replace_at(lista, 0, 15)
  end

  def make_request(0), do: []

  def make_request(page) do
    url = "http://challenge.dienekes.com.br/api/numbers?page=#{page}"

    url
    |> URI.parse()
    |> Map.put(:query, URI.encode_query(rrsets: false))
    |> URI.to_string()

    IO.puts(url)

    case HTTPoison.get(url) do
      {:ok, %{status_code: 200, body: body}} ->
        modelo = Poison.decode!(body)

        if(length(modelo["numbers"]) != 0) do
          modelo["numbers"] ++ make_request(page + 1)
        else
          make_request(0)
        end

      {:ok, %{status_code: 404}} ->
        IO.puts("Conexão com o servidor não estabelicida")
        IO.write("URL : ")
        IO.puts(url)

      # Caso o servidor caia tente novamente
      {:ok, %{status_code: 500}} ->
        make_request(page)

      {:error, %{reason: reason}} ->
        IO.puts(reason)
        # do something with an error
    end
  end

  def main do
    # response = HTTPoison.get(url)

    # req = Poison.decode!(response.body)
    # list = req["numbers"]
    # IO.inspect(list)
    list = make_request(9900)
    # IO.inspect(list)

    IO.write("List Len: ")
    IO.puts(length(list))

    #

    # verify_floats(list)

    # a = [1, 2, 3, 4]
    # a = testeLista(a)
    # IO.inspect(a)

    # case HTTPoison.get(url) do
    #   {:ok, %{status_code: 200, body: body}} ->
    #     modelo = Poison.decode!(body)
    #     modelo["numbers"]

    #   {:ok, %{status_code: 404}} ->
    #     IO.puts("Erro1")

    #   # do something with a 404

    #   {:error, %{reason: reason}} ->
    #     IO.puts("Erro1")
    # do something with an error
    # end
  end
end
