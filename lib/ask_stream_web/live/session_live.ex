defmodule AskStreamWeb.SessionLive do
  use AskStreamWeb, :dashboard_live_view
  import AskStream.QA, only: [get_session: 1]

  def mount(params, _session, socket) do
    with {:ok, session} <- get_session(params["id"]) do
      socket = socket |> assign(session: session)

      {:ok, socket}
    else
      _ -> {:error, :not_found}
    end
  end

  def render(assigns) do
    ~H"""
    Session?
    """
  end
end
