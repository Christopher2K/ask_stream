defmodule AskStream.QAFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AskStream.QA` context.
  """

  @doc """
  Generate a question.
  """
  def question_fixture(attrs \\ %{}) do
    {:ok, question} =
      attrs
      |> Enum.into(%{

      })
      |> AskStream.QA.create_question()

    question
  end

  @doc """
  Generate a session.
  """
  def session_fixture(attrs \\ %{}) do
    {:ok, session} =
      attrs
      |> Enum.into(%{

      })
      |> AskStream.QA.create_session()

    session
  end
end
