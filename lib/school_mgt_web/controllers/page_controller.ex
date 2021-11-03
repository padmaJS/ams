defmodule SchoolMgtWeb.PageController do
  use SchoolMgtWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
