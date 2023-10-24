defmodule AskStream.QA.Question do
  alias AskStream.QA.Session
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          question: String.t(),
          author_username: String.t(),
          is_skipped: boolean(),
          is_answered: boolean()
        }

  @primary_key {:id, :binary_id, []}
  @foreign_key_type :binary_id
  schema "questions" do
    field :question, :string
    field :author_username, :string
    field :is_skipped, :boolean
    field :is_answered, :boolean

    belongs_to :session, Session

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :author_username, :is_skipped, :is_answered])
    |> validate_required([:question, :author_username])
  end
end
