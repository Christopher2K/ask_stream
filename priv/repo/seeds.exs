# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AskStream.Repo.insert!(%AskStream.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias AskStream.{Repo, QA}

# Create fake sessions
fake_sessions =
  for _ <- 1..20 do
    datetime =
      Faker.DateTime.between(~D"2023-01-01", ~D"2023-10-01") |> DateTime.truncate(:second)

    %{
      name: "Q/A #{DateTime.to_date(datetime)}",
      inserted_at: datetime,
      updated_at: datetime
    }
  end

dbg(fake_sessions)

Repo.insert_all(QA.Session, fake_sessions)
