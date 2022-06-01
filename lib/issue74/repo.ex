defmodule Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.SQLite3, otp_app: :issue74
end
