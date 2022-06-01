```elixir
iex(26)> Issue74.run1

# 16:35:16 #PID<0.275.0> IEx.Evaluator.init/4
# Ecto.Adapters.SQLite3.Codec.utc_datetime_encode(~U[2016-02-25 19:02:16Z])

# 16:35:16 #PID<0.275.0> IEx.Evaluator.init/4
# Ecto.Adapters.SQLite3.Codec.utc_datetime_encode/1 -> {:ok, "2016-02-25T19:02:16"}

16:35:16.629 [debug] QUERY OK source="things" db=0.3ms idle=1452.8ms
SELECT t0."id", t0."thing_id", t0."user_id", t0."timestamp" FROM "things" AS t0 WHERE (t0."timestamp" < ?) ["2016-02-25T19:02:16"]

# 16:35:16 #PID<0.275.0> IEx.Evaluator.init/4
# Ecto.Adapters.SQLite3.Codec.utc_datetime_decode("2016-02-25 19:02:16")
[
  %Thing{
    __meta__: #Ecto.Schema.Metadata<:loaded, "things">,
    id: 9,
    thing_id: 9,
    timestamp: ~U[2016-02-25 19:02:16Z],
    user_id: 2
  },
  %Thing{
    __meta__: #Ecto.Schema.Metadata<:loaded, "things">,
    id: 10,
    thing_id: 10,
    timestamp: ~U[2016-02-24 17:49:14Z],
    user_id: 2
  }
]

# 16:35:16 #PID<0.275.0> IEx.Evaluator.init/4
# Ecto.Adapters.SQLite3.Codec.utc_datetime_decode/1 -> {:ok, ~U[2016-02-25 19:02:16Z]}

# 16:35:16 #PID<0.275.0> IEx.Evaluator.init/4
# Ecto.Adapters.SQLite3.Codec.utc_datetime_decode("2016-02-24 17:49:14")

# 16:35:16 #PID<0.275.0> IEx.Evaluator.init/4
# Ecto.Adapters.SQLite3.Codec.utc_datetime_decode/1 -> {:ok, ~U[2016-02-24 17:49:14Z]}
redbug done, local_done - 6
```

```elixir
iex(29)> Issue74.run2

16:36:07.092 [debug] QUERY OK source="things" db=0.1ms idle=1916.1ms
SELECT t0."id", t0."thing_id", t0."user_id", t0."timestamp" FROM "things" AS t0 WHERE ((t0."timestamp", t0."thing_id") < (?, ?)) [~U[2016-02-25 19:02:16Z], 1]

# 16:36:07 #PID<0.275.0> IEx.Evaluator.init/4
# Ecto.Adapters.SQLite3.Codec.utc_datetime_decode("2016-02-25 19:02:16")

# 16:36:07 #PID<0.275.0> IEx.Evaluator.init/4
# Ecto.Adapters.SQLite3.Codec.utc_datetime_decode/1 -> {:ok, ~U[2016-02-25 19:02:16Z]}

# 16:36:07 #PID<0.275.0> IEx.Evaluator.init/4
# Ecto.Adapters.SQLite3.Codec.utc_datetime_decode("2016-02-24 17:49:14")
[
  %Thing{
    __meta__: #Ecto.Schema.Metadata<:loaded, "things">,
    id: 9,
    thing_id: 9,
    timestamp: ~U[2016-02-25 19:02:16Z],
    user_id: 2
  },
  %Thing{
    __meta__: #Ecto.Schema.Metadata<:loaded, "things">,
    id: 10,
    thing_id: 10,
    timestamp: ~U[2016-02-24 17:49:14Z],
    user_id: 2
  }
]

# 16:36:07 #PID<0.275.0> IEx.Evaluator.init/4
# Ecto.Adapters.SQLite3.Codec.utc_datetime_decode/1 -> {:ok, ~U[2016-02-24 17:49:14Z]}
redbug done, timeout - 2
```
