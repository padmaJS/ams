defmodule SchoolMgtWeb.StudentController do
  use SchoolMgtWeb, :controller
  alias SchoolMgt.Students
  alias SchoolMgt.Students.Student
  def index(conn, _) do
    students = Students.list_students()
    render(conn, "index.html", students: students)
  end

  def new(conn, _) do
    changeset = Students.change_student(%Student{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"student" => student_data}) do
    Students.create_student(student_data)
    redirect(conn, to: Routes.student_path(conn, :index))
  end

  def edit(conn, %{"id" => id}) do
    student = Students.get_student(id)
    changeset = Students.change_student(student)
    render(conn, "edit.html", changeset: changeset, student: student)
  end

  def update(conn, %{"id" => id, "student" => student_data}) do
    Students.update_student(id, student_data)
    redirect(conn, to: Routes.student_path(conn, :index))
  end

  def delete(conn, %{"id" => id}) do
    Students.delete_student(id)
    redirect(conn, to: Routes.student_path(conn, :index))
  end
end
