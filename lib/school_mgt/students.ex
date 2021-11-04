defmodule SchoolMgt.Students do
  alias SchoolMgt.Repo
  alias SchoolMgt.Students.Student

  def list_students() do
    Repo.all(Student)
  end

  def change_student(student, attr \\ %{}) do
    Student.changeset(student, attr)
  end

  def create_student(student) do
    Student.changeset(%Student{}, student)
    |> Repo.insert!()
  end

  def get_student(id) do
    Repo.get!(Student, id)
  end

  def update_student(id, attr) do
    Repo.get(Student, id)
    |> Student.changeset(attr)
    |> Repo.update!()
  end

  def delete_student(id) do
    Repo.get!(Student, id)
    |> Repo.delete!()
  end
end
