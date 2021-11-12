defmodule SchoolMgtWeb.SessionController do
  use SchoolMgtWeb, :controller
  alias SchoolMgt.Accounts
  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => user_info}) do
    user = Accounts.get_by_username(user_info["username"])
    case Bcrypt.check_pass(user, user_info["encrypted_password"]) do
      {:ok, user} ->
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "Signed in successfully")
        |> redirect(to: Routes.class_room_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:error, "Something is wrong with your username or password")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Signed out successfully")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
