defmodule AskStream.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question, :string, null: false
      add :author_username, :string, null: false
      add :is_skipped, :boolean, default: false
      add :is_answered, :boolean, default: false

      timestamps(type: :utc_datetime)
    end
  end
end
