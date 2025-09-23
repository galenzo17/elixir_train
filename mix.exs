defmodule ElixirTrain.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_train,
      version: "0.1.0",
      elixir: "~> 1.17",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {ElixirTrain.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Development and Testing
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.31", only: :dev, runtime: false},
      {:excoveralls, "~> 0.18", only: :test},
      {:mock, "~> 0.3.0", only: :test},

      # Core Dependencies
      {:jason, "~> 1.4"},
      {:plug_cowboy, "~> 2.6"},
      {:phoenix, "~> 1.7.0"},
      {:phoenix_live_view, "~> 0.20.0"},
      {:phoenix_html, "~> 3.3"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.8.0"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:ecto, "~> 3.11"},
      {:ecto_sql, "~> 3.11"},
      {:postgrex, "~> 0.17"},

      # HTTP Client
      {:httpoison, "~> 2.0"},
      {:tesla, "~> 1.8"},

      # Background Jobs
      {:oban, "~> 2.17"},

      # Utils
      {:timex, "~> 3.7"},
      {:decimal, "~> 2.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  defp aliases do
    [
      setup: ["deps.get", "compile"],
      test: ["test"],
      "test.coverage": ["coveralls.html"],
      quality: ["format", "credo --strict", "dialyzer"],
      ci: ["format --check-formatted", "credo --strict", "test"]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
