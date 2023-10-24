defmodule AskStream.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")
      add :name, :string, null: true, default: nil
      add :is_archived, :boolean, default: false

      timestamps(type: :utc_datetime)
    end

    alter table(:questions) do
      add :session_id,
          references(:sessions, on_delete: :delete_all, on_update: :update_all, type: :uuid)
    end
  end
end
