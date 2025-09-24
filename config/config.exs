import Config

config :elixir_train,
  ecto_repos: [ElixirTrain.Repo]

config :elixir_train, ElixirTrainWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [accepts: ~w(json)],
  pubsub_server: ElixirTrain.PubSub

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"