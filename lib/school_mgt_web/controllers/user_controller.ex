defmodule SchoolMgtWeb.UserController do
  use SchoolMgtWeb, :controller
  alias SchoolMgt.User
  alias SchoolMgt.Accounts
  def new(conn, _) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_data}) do
    case Accounts.create_user(user_data) do
      %User{} = user ->
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "User created successfully")
        |> redirect(to: Routes.class_room_path(conn, :index))
      _ ->
        redirect(conn, to: Routes.user_path(conn, :new))
    end
  end
end
