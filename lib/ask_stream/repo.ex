defmodule AskStream.Repo do
  use Ecto.Repo,
    otp_app: :ask_stream,
    adapter: Ecto.Adapters.Postgres
end
