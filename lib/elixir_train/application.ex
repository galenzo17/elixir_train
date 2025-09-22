defmodule ElixirTrain.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      # ElixirTrain.Repo,
      # Start the Telemetry supervisor
      # ElixirTrainWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirTrain.PubSub},
      # Start the Endpoint (http/https)
      # ElixirTrainWeb.Endpoint,
      # Start Oban for background jobs
      # {Oban, oban_config()}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirTrain.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    # ElixirTrainWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp oban_config do
    Application.fetch_env!(:elixir_train, Oban)
  end
end