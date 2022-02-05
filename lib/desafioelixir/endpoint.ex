# ./lib/webhook_processor/endpoint.ex
defmodule Desafioelixir.Endpoint do
  use Plug.Router
  require Logger

  plug(Plug.Logger)
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)

  get "/heath" do
    send_resp(conn, 200, Poison.encode!(%{status: "Server OK "}))
  end

  get "/" do
    send_resp(
      conn,
      200,
      Poison.encode!(%{response: Enum.fetch!(Desafioelixir.Results.get_lista(), 0)})
    )
  end

  match _ do
    send_resp(conn, 404, Poison.encode!(%{error: "EndPoint não encontrado "}))
  end
end
