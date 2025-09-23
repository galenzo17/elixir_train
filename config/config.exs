import Config

config :elixir_train,
  ecto_repos: [ElixirTrain.Repo]

config :elixir_train, ElixirTrain.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :elixir_train, ElixirTrainWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ElixirTrainWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ElixirTrain.PubSub,
  live_view: [signing_salt: "secret_salt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"