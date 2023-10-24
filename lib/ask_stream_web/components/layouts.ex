defmodule AskStreamWeb.Layouts do
  use AskStreamWeb, :html

  embed_templates "layouts/*"

  def base_page(assigns) do
    ~H"""
    <nav class="sticky top-0 flex flex-row justify-between items-center w-full h-16 px-5 mb-5 border-b border-slate-100 bg-white">
      <a href="/" class="font-bold text-xl">AskStream!</a>

      <a href={~p"/login"} class="border-2 rounded-md px-3 py-1">
        Login
      </a>
    </nav>

    <main class="flex flex-direction justify-start items-start px-3">
      <div class="h-[1000px]" />
      <%= @inner_content %>
    </main>
    """
  end

  def dashboard(assigns) do
    ~H"""
    <nav
      x-data="{ open: false }"
      class="sticky top-0 flex flex-row justify-between items-center w-full h-16 px-5 mb-5 border-b border-slate-100 bg-white"
    >
      <a href="/" class="font-bold text-xl">AskStream!</a>

      <.button @click="open = !open">
        Menu
      </.button>

      <div
        x-show="open"
        x-cloak
        class="absolute bottom-0 left-0 translate-y-full flex flex-col justify-start items-start border-t border-slate-100 w-full bg-slate-100 h-fit-cotent"
      >
        <.nav_item href="">
          Dashboard
        </.nav_item>

        <.nav_item href="">
          Settings
        </.nav_item>

        <.nav_item href="">
          Logout
        </.nav_item>
      </div>
    </nav>

    <main class="flex flex-direction justify-start items-start px-3">
      <div class="h-[1000px]" />
      <%= @inner_content %>
    </main>
    """
  end

  ### JS FUNCTIONS
end
