defmodule ElixirTrainWeb.HealthController do
  use Phoenix.Controller

  def index(conn, _params) do
    json(conn, %{status: "ok"})
  end
end