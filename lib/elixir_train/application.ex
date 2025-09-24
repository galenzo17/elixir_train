defmodule ElixirTrain.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElixirTrain.Repo,
      {Phoenix.PubSub, name: ElixirTrain.PubSub},
      ElixirTrainWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: ElixirTrain.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    ElixirTrainWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end