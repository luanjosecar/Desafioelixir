defmodule Desafioelixir.Application do
  use Application
  use Supervisor

  @port Application.get_env(:desafioelixir, :port) || "4000"
  def start(_type, _args) do
    children = [
      worker(Desafioelixir.Results, []),
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Desafioelixir.Endpoint,
        options: [port: String.to_integer(@port)]
      )
    ]

    opts = [strategy: :one_for_one, name: Desafioelixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
