import Config

config :elixir_train, ElixirTrain.Repo,
  database: ":memory:",
  pool: Ecto.Adapters.SQL.Sandbox

config :elixir_train, ElixirTrainWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warning
config :phoenix, :plug_init_mode, :runtime