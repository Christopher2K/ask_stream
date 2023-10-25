defmodule AskStream.QA.Session do
  alias AskStream.QA.Question
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          name: String.t(),
          is_archived: boolean()
        }

  @primary_key {:id, :binary_id, []}
  @foreign_key_type :binary_id
  schema "sessions" do
    field :name, :string
    field :is_archived, :boolean

    has_many :questions, Question

    timestamps(type: :utc_datetime, inserted_at_source: :created_at)
  end

  @doc false
  def changeset(session, attrs) do
    session
    |> cast(attrs, [:name, :is_archived, :inserted_at, :updated_at])
    |> validate_required([])
  end
end
