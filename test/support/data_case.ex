defmodule ElixirTrain.DataCase do
  @moduledoc """
  This module defines the setup for tests requiring
  access to the application's data layer.

  You may define functions here to be used as helpers in
  your tests.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use ElixirTrain.DataCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      alias ElixirTrain.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import ElixirTrain.DataCase
    end
  end

  setup tags do
    ElixirTrain.DataCase.setup_sandbox(tags)
    :ok
  end

  @doc """
  Starts an Ecto SQL sandbox owner for the repo according to the test `tags` and registers cleanup.
  
  If `tags[:async]` is truthy the sandbox owner is started without `:shared` access (suitable for async tests);
  otherwise it is started in shared mode so the test process can interact with the database. An `on_exit`
  callback is registered to stop the sandbox owner when the test finishes.
  
  Parameters
    - tags: ExUnit test tags (map) — `:async` controls whether the sandbox is started in shared mode.
  
  """
  @spec setup_sandbox(map()) :: :ok
  def setup_sandbox(tags) do
    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(ElixirTrain.Repo, shared: not tags[:async])
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
  end

  @doc """
  Transforms an Ecto.Changeset's errors into a map of human-readable error messages.
  
  Placeholders in error messages (e.g. `%{count}`) are interpolated using the options provided with each error. The result maps field names to a list of error strings suitable for assertions in tests.
  
  ## Examples
  
      assert {:error, changeset} = Accounts.create_user(%{password: "short"})
      assert "should be at least 10 character(s)" in errors_on(changeset).password
      assert %{password: ["should be at least 10 character(s)"]} = errors_on(changeset)
  """
  @spec errors_on(Ecto.Changeset.t()) :: %{optional(atom()) => [String.t()]}
  def errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      Regex.replace(~r"%{(\w+)}", message, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end