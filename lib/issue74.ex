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

  def run(since_timestamp \\ ~U[2016-02-25 19:02:15Z]) do
    Thing |> where([t], t.timestamp < ^since_timestamp) |> Repo.all()
  end
end
