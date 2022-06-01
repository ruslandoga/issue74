defmodule Issue74.MixProject do
  use Mix.Project

  def project do
    [
      app: :issue74,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Issue74.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sqlite3, ">= 0.0.0"},
      {:rexbug, ">= 0.0.0"}
    ]
  end
end
