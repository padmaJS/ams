defmodule SchoolMgtWeb.ClassRoomController do
  use SchoolMgtWeb, :controller

  alias SchoolMgt.ClassRooms
  alias SchoolMgt.ClassRooms.ClassRoom
  alias SchoolMgt.Accounts

  plug :check_auth when action in [:new, :create, :edit, :update, :delete]

  defp check_auth(conn, _) do
    user_id = get_session(conn, :user_id)
    super_admin = get_session(conn, :super_admin)
    if !!user_id and super_admin do
      current_user = Accounts.get_user(user_id)

      conn
      |> assign(:current_user, current_user)
    else
      conn
      |> put_flash(:error, "You are not authorized for accessing that page")
      |> redirect(to: Routes.class_room_path(conn, :index))
      |> halt()
    end
  end



  def index(conn, _) do
    class_rooms = ClassRooms.list_class()
    render(conn, "index.html", class_rooms: class_rooms)
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", students: ClassRooms.list_students_for_class(id), class_room_id: id)
  end

  def new(conn, _) do
    changeset = ClassRooms.change_class(%ClassRoom{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"class_room" => class_room_data}) do
    ClassRooms.create_class(class_room_data)
    redirect(conn, to: Routes.class_room_path(conn, :index))
  end

  def edit(conn, %{"id" => id}) do
    class = ClassRooms.get_class(id)
    changeset = ClassRooms.change_class(class)
    render(conn, "edit.html", changeset: changeset, class: class)
  end

  def update(conn, %{"id" => id, "class_room" => class_room_data}) do
    ClassRooms.update_class(id, class_room_data)
    redirect(conn, to: Routes.class_room_path(conn, :index))
  end

  def delete(conn, %{"id" => id}) do
    ClassRooms.delete_class(id)
    redirect(conn, to: Routes.class_room_path(conn, :index))
  end
end
