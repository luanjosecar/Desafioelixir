defmodule Testes do
  @moduledoc """
  Documentation for `Testes`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Testes.hello()
      :world

  """
  def hello do
    url = "http://challenge.dienekes.com.br/api/numbers?page=1"

    case HTTPoison.get(url) do
      {:ok, %{status_code: 200, body: body}} ->
        IO.puts(Poison.decode!(body))

      {:ok, %{status_code: 404}} ->
        IO.puts("Erro1")

      # do something with a 404

      {:error, %{reason: reason}} ->
        IO.puts("Erro1")
        # do something with an error
    end
  end
end
