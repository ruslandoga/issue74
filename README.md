```elixir
iex> Issue74.run(~U[2016-02-25 19:02:15Z])

# [debug] QUERY OK source="things" db=0.5ms queue=0.1ms idle=1714.0ms
# SELECT t0."id", t0."thing_id", t0."user_id", t0."timestamp" FROM things AS t0 WHERE (t0."timestamp" < ?) ["2016-02-25T19:02:15"]

[
  %Thing{
    __meta__: #Ecto.Schema.Metadata<:loaded, "things">,
    id: 9,
    thing_id: 9,
    timestamp: ~U[2016-02-25 19:02:16Z], # shouldn't have been returned
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

# it seems to be come down to this for SQLite, unless extra info is provided
iex> "2016-02-25 19:02:16" < "2016-02-25T19:02:15Z"
true
```
