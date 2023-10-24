defmodule AskStreamWeb.PageController do
  use AskStreamWeb, :controller

  def home(conn, _params),
    do: conn |> put_layout(html: {AskStreamWeb.Layouts, :base_page}) |> render(:home)

  def login(conn, _params),
    do: conn |> put_layout(html: {AskStreamWeb.Layouts, :base_page}) |> render(:login)
end
