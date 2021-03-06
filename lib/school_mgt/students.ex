defmodule SchoolMgt.Students do
  alias SchoolMgt.Repo
  alias SchoolMgt.Students.Student

  def list_students() do
    Repo.all(Student)
  end

  def change_student(student, attr \\ %{}) do
    Student.changeset(student, attr)
  end

  def create_student(student, id) do
    # change_student(%Student{:class_room_id => id}, student)
    # |> Repo.insert!()
    student_params = Map.put student, "class_room_id", id
    change_student(%Student{}, student_params)
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

  def get_student_by_class_id(id) do
    Repo.get_by(Student, classroom_id: id)
  end
end
