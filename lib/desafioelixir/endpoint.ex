# ./lib/webhook_processor/endpoint.ex
defmodule Desafioelixir.Endpoint do
  @moduledoc """
  A Plug responsible for logging request info, parsing request body's as JSON,
  matching routes, and dispatching responses.
  """

  use Plug.Router

  # This module is a Plug, that also implements it's own plug pipeline, below:

  # Using Plug.Logger for logging request information
  plug(Plug.Logger)
  # Import functions used for matching routes
  plug(:match)
  # Using Poison for JSON decoding
  # Note, order of plugs is important, by placing this _after_ the 'match' plug,
  # we will only parse the request AFTER there is route match.
  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  # Import functions used for dispatching responses
  plug(:dispatch)

  # A simple route to test that the server is up
  # Note, all routes must return a connection as per the Plug spec.
  get "/heath" do
    send_resp(conn, 200, "pong!")
  end

  get "/version" do
    resp =
      case :application.get_key(:webhook_processor, :vsn) do
        {:ok, vsn} -> vsn
        _ -> "version not found :("
      end

    send_resp(conn, 200, resp)
  end

  # Handle incoming events, if the payload is the right shape, process the
  # events, otherwise return an error.
  post "/" do
  end

  match _ do
    send_resp(conn, 404, "oops... Nothing here :(")
  end
end
