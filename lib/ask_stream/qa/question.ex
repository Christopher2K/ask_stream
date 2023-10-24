defmodule AskStream.QA.Question do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, []}
  schema "questions" do
    field :question, :string
    field :author_username, :string
    field :is_skipped, :boolean
    field :is_answered, :boolean

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :author_username, :is_skipped, :is_answered])
    |> validate_required([:question, :author_username])
  end
end
