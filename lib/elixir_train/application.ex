defmodule ElixirTrain.Application do
  @moduledoc false

  use Application

  @impl true
  @doc """
  Starts the application supervision tree.
  
  Builds a supervision specification (currently with a single `Phoenix.PubSub` child; other
  potential children such as Repo, Telemetry, Endpoint, and Oban are present but commented out),
  calls `say_hello/0` as a startup side effect, and then starts the supervisor with a
  `:one_for_one` strategy named `ElixirTrain.Supervisor`.
  
  Returns the result of `Supervisor.start_link/2`.
  """
  @spec start(any(), any()) :: {:ok, pid()} | :ignore | {:error, term()}
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

    # Llamar say_hello DESPUÉS de definir opts pero ANTES del Supervisor
    say_hello()

    Supervisor.start_link(children, opts)
  end

  @doc """
  Prints a simple greeting to standard output.
  
  This convenience function writes "Hello" to stdout and returns `:ok`.
  """
  @spec say_hello() :: :ok
  def say_hello do
    IO.puts "Hello"
  end
  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  @doc """
  Application callback invoked when the application's runtime configuration changes.
  
  This function is called with the sets of changed, new, and removed configuration values. It currently performs no action and returns `:ok`. Uncomment and implement endpoint or other runtime updates here if dynamic reconfiguration is needed.
  """
  @spec config_change(term(), term(), term()) :: :ok
  def config_change(_changed, _new, _removed) do
    # ElixirTrainWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp oban_config do
    Application.fetch_env!(:elixir_train, Oban)
  end
end
