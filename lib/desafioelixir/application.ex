defmodule Desafioelixir.Application do
  use Application
  use Supervisor

  def start(_type, _args) do
    # Desafioelixir.main()

    children = [
      worker(Desafioelixir.Results, []),
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Desafioelixir.Endpoint,
        options: [port: String.to_integer(System.get_env("APP_PORT") || "4000")]
      )
    ]

    opts = [strategy: :one_for_one, name: Desafioelixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
