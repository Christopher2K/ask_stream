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

# Create fake sessions with questions
fake_sessions =
  for _ <- 1..20 do
    datetime =
      Faker.DateTime.between(~D"2023-01-01", ~D"2023-10-01") |> DateTime.truncate(:second)

    Repo.insert!(%QA.Session{
      name: "Q/A #{DateTime.to_date(datetime)}",
      inserted_at: datetime,
      updated_at: datetime,
      questions:
        for _ <- 1..10 do
          question_datetime =
            datetime
            |> Faker.DateTime.between(DateTime.add(datetime, 2, :hour))
            |> DateTime.truncate(:second)

          %QA.Question{
            question: Faker.Lorem.sentence(),
            author_username: Faker.Internet.user_name(),
            inserted_at: question_datetime,
            updated_at: question_datetime
          }
        end
    })
  end
