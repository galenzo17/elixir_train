import Config

config :elixir_train, ElixirTrain.Repo,
  database: ":memory:",
  pool_size: 10,
  show_sensitive_data_on_connection_error: true

config :elixir_train, ElixirTrainWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false

config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime