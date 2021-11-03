defmodule SchoolMgtWeb.SchoolMgtController do
  use SchoolMgtWeb, :controller
  alias SchoolMgt.Classes
  alias SchoolMgt.Classes.Class
  def index(conn, _) do
    classes = Classes.list_class()
    render(conn, "index.html", classes: classes)
  end

  def new(conn, _) do
    changeset = Classes.change_class(%Class{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"class" => class_data}) do
    Classes.create_class(class_data)
    redirect(conn, to: Routes.school_mgt_path(conn, :index))
  end

  def edit(conn, %{"id" => id}) do
    class = Classes.get_class(id)
    changeset = Classes.change_class(class)
    render(conn, "edit.html", changeset: changeset, class: class)
  end

  def update(conn, %{"id" => id, "class" => class_data}) do
    Classes.update_class(id, class_data)
    redirect(conn, to: Routes.school_mgt_path(conn, :index))
  end

  def delete(conn, %{"id" => id}) do
    Classes.delete_class(id)
    redirect(conn, to: Routes.school_mgt_path(conn, :index))
  end
end
#nice
