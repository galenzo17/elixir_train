defmodule ElixirTrainWeb.Router do
  use Phoenix.Router
  import Phoenix.Controller

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirTrainWeb do
    pipe_through :api

    get "/health", HealthController, :index
  end
end