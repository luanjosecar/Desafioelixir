# ./lib/webhook_processor/endpoint.ex
defmodule Desafioelixir.Endpoint do
  use Plug.Router
  require Logger

  @content_type "application/json"
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
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(
      200,
      Poison.encode!(%{
        type: "List of Floats",
        response: Enum.fetch!(Desafioelixir.Results.get_lista(), 0)
      })
    )
  end

  match _ do
    send_resp(conn, 404, Poison.encode!(%{error: "EndPoint não encontrado "}))
  end
end
