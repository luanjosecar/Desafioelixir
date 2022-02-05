defmodule Desafioelixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :desafioelixir,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Desafioelixir.Application, []}
    ]
  end

  defp deps do
    [
      {:poison, "~> 5.0"},
      {:httpoison, "~> 1.5"},
      {:plug, "~> 1.6"},
      {:cowboy, "~> 2.4"},
      {:credo, "~> 0.10"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
