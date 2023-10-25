defmodule AskStreamWeb.DashboardLive do
  alias AskStreamWeb.DashboardSessions

  use AskStreamWeb, :dashboard_live_view

  def render(assigns) do
    ~H"""
    <h1 class="text-3xl font-bold mb-10">Dashboard</h1>
    <.live_component module={DashboardSessions} id="sessions" />
    """
  end
end
