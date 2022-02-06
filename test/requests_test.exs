defmodule Desafioelixir.EndpointTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Desafioelixir.Endpoint.init([])

  test "teste de conexão simples" do
    conn = conn(:get, "/heath")

    conn = Desafioelixir.Endpoint.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == Poison.encode!(%{status: "Server OK "})
  end

  test "rota não valida" do
    conn = conn(:get, "/teste")
    conn = Desafioelixir.Endpoint.call(conn, @opts)
    assert conn.status == 404
  end

  test "requisição para a lista de análise" do
    conn = conn(:get, "/")
    conn = Desafioelixir.Endpoint.call(conn, @opts)
    assert conn.status == 200
  end

  test "Teste de outro método alem do get" do
    conn = conn(:post, "/", %{})
    conn = Desafioelixir.Endpoint.call(conn, @opts)
    assert conn.status == 404
  end

  test "Teste de outro método alem do get 2" do
    conn = conn(:put, "/")
    conn = Desafioelixir.Endpoint.call(conn, @opts)
    assert conn.status == 404
  end
end
