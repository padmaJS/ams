defmodule SchoolMgtWeb.StudentController do
  use SchoolMgtWeb, :controller
  alias SchoolMgt.Students
  alias SchoolMgt.Students.Student
  alias SchoolMgt.Accounts

  plug :check_auth when action in [:new, :create, :edit, :update, :delete]

  defp check_auth(conn, _) do
    if user_id = get_session(conn, :user_id) do
      current_user = Accounts.get_user(user_id)

      conn
      |> assign(:current_user, current_user)
    else
      conn
      |> put_flash(:error, "You are not authorized for accessing that page")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end
  def index(conn, %{"class_room_id" => id}) do
    students = Students.list_students()
    render(conn, "index.html", students: students, id: id)
  end

  def new(conn, %{"class_room_id" => class_room_id}) do
    changeset = Students.change_student(%Student{})
    render(conn, "new.html", changeset: changeset, class_room_id: class_room_id)
  end

  def create(conn, %{"student" => student_data, "class_room_id" => id}) do
    Students.create_student(student_data, id)
    redirect(conn, to: Routes.class_room_path(conn, :show, id))
  end

  def edit(conn, %{"id" => id, "class_room_id" => class_room_id}) do
    student = Students.get_student(id)
    changeset = Students.change_student(student)
    render(conn, "edit.html", changeset: changeset, student: student, class_room_id: class_room_id)
  end

  def update(conn, %{"id" => id, "student" => student_data, "class_room_id" => class_room_id}) do
    Students.update_student(id, student_data)
    redirect(conn, to: Routes.class_room_path(conn, :show, class_room_id))
  end

  def delete(conn, %{"class_room_id" => class_room_id, "id" => id}) do
    Students.delete_student(id)
    redirect(conn, to: Routes.class_room_path(conn, :show, class_room_id))
  end
end
