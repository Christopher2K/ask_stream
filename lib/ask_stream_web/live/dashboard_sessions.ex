defmodule AskStreamWeb.DashboardSessions do
  alias AskStream.QA

  import AskStreamWeb.CustomComponents

  use AskStreamWeb, :live_component

  def render(assigns) do
    ~H"""
    <section id={@id} class="mb-5 w-full">
      <header class="flex flex-row justify-between items-end mb-5">
        <h2 class="text-2xl font-medium">Latest sessions</h2>
        <.button>Create a new session</.button>
      </header>
      <div>
        <p :if={length(@latest_sessions) == 0}>No sessions! You can start one</p>

        <div
          :if={length(@latest_sessions) > 0}
          class="flex flex-col justify-start items-start w-full gap-3"
        >
          <%= for session <- @latest_sessions do %>
            <article class="w-full border-2 border-slate-400 rounded-md px-2 py-3 flex flex-row justify-between items-center">
              <p class="text-lg font-medium">
                <%= session.name %>
              </p>
              <.button navigate={~p"/dashboard/sessions/#{session.id}"} class="">Details</.button>
            </article>
          <% end %>
        </div>
      </div>
    </section>
    """
  end

  def mount(socket) do
    socket = socket |> assign(latest_sessions: QA.list_recent_sessions())
    {:ok, socket}
  end
end
