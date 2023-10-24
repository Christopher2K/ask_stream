defmodule AskStreamWeb.CustomComponents do
  use Phoenix.Component

  attr :href, :string, default: nil
  attr :class, :string, default: ""
  attr :rest, :global
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
      <a href={@href} class={@class} {@rest}>
        <%= render_slot(@inner_block) %>
      </a>
    <% else %>
      <button href={@href} class={@class} {@rest}>
        <%= render_slot(@inner_block) %>
      </button>
    <% end %>
    """
  end

  attr :href, :string, default: nil
  attr :class, :string, default: ""
  attr :rest, :global
  slot :inner_block

  def nav_item(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        "border-b border-slate-100 bg-neutral-50 px-5 py-3 w-full cursor-pointer" <>
          "" <> assigns[:class]
      )

    ~H"""
    <%= if @href do %>
      <a href={@href} class={@class} {@rest}>
        <%= render_slot(@inner_block) %>
      </a>
    <% else %>
      <button href={@href} class={@class} {@rest}>
        <%= render_slot(@inner_block) %>
      </button>
    <% end %>
    """
  end
end
