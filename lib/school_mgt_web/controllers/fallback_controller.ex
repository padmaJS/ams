defmodule SchoolMgtWeb.FallbackController do
  use SchoolMgtWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:forbidden)
    |> put_view(SchoolMgtWeb.ErrorView)
    |> render(:"403")
  end
end
