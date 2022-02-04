defmodule Requests do
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
end
