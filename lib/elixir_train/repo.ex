defmodule ElixirTrain.Repo do
  use Ecto.Repo,
    otp_app: :elixir_train,
    adapter: Ecto.Adapters.SQLite3
end