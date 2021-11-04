defmodule SchoolMgtWeb.SchoolMgtController do
  use SchoolMgtWeb, :controller
  alias SchoolMgt.ClassRooms
  alias SchoolMgt.ClassRooms.Room
  def index(conn, _) do
    class_rooms = ClassRooms.list_class()
    render(conn, "index.html", class_rooms: class_rooms)
  end

  def new(conn, _) do
    changeset = ClassRooms.change_class(%Room{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"room" => room_data}) do
    ClassRooms.create_class(room_data)
    redirect(conn, to: Routes.school_mgt_path(conn, :index))
  end

  def edit(conn, %{"id" => id}) do
    class = ClassRooms.get_class(id)
    changeset = ClassRooms.change_class(class)
    render(conn, "edit.html", changeset: changeset, class: class)
  end

  def update(conn, %{"id" => id, "room" => room_data}) do
    ClassRooms.update_class(id, room_data)
    redirect(conn, to: Routes.school_mgt_path(conn, :index))
  end

  def delete(conn, %{"id" => id}) do
    ClassRooms.delete_class(id)
    redirect(conn, to: Routes.school_mgt_path(conn, :index))
  end
end
