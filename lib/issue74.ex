defmodule Thing do
  use Ecto.Schema

  schema "things" do
    field(:thing_id, :integer)
    field(:user_id, :integer)
    field(:timestamp, :utc_datetime)
  end
end

defmodule Issue74 do
  import Ecto.Query

  def run1 do
    since_timestamp = ~U[2016-02-25 19:02:16Z]

    trace(fn ->
      Thing |> where([t], t.timestamp < ^since_timestamp) |> Repo.all()
    end)
  end

  def run2 do
    since_timestamp = ~U[2016-02-25 19:02:16Z]
    since_thing_id = 1

    trace(fn ->
      Thing
      |> where(
        [t],
        fragment("(?, ?) < (?, ?)", t.timestamp, t.thing_id, ^since_timestamp, ^since_thing_id)
      )
      |> Repo.all()
    end)
  end

  def trace(fun) do
    Rexbug.start("Ecto.Adapters.SQLite3.Codec :: return",
      max_msg_size: 10000,
      msgs: 100_000
    )

    result = fun.()
    # Rexbug.stop()
    result
  end
end
