defmodule AskStreamWeb.CustomComponents do
  use Phoenix.Component

  attr :href, :string, default: nil
  attr :class, :string, default: ""

  slot :inner_block

  def button(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        "flex flex-row justify-center items-center px-2 py-2 rounded-md bg-slate-700 text-white text-sm font-bold hover:bg-slate-800" <>
          "" <> assigns[:class]
      )

    ~H"""
    <%= if @href do %>
      <a href={@href} class={@class}>
        <%= render_slot(@inner_block) %>
      </a>
    <% else %>
      <button href={@href} class={@class}>
        <%= render_slot(@inner_block) %>
      </button>
    <% end %>
    """
  end
end
