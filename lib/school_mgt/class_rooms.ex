defmodule SchoolMgt.ClassRooms do
  alias SchoolMgt.Repo
  alias SchoolMgt.ClassRooms.ClassRoom
  alias SchoolMgt.Students.Student

  def list_class() do
    Repo.all(ClassRoom)
  end

  def change_class(class, attr \\ %{}) do
    ClassRoom.changeset(class, attr)
  end

  def create_class(class) do
    ClassRoom.changeset(%ClassRoom{}, class)
    |> Repo.insert!()
  end

  def get_class(id) do
    Repo.get!(ClassRoom, id)
  end

  def update_class(id, attr) do
    Repo.get(ClassRoom, id)
    |> ClassRoom.changeset(attr)
    |> Repo.update!()
  end

  def delete_class(id) do
    Repo.get!(ClassRoom, id)
    |> Repo.delete!()
  end

  def list_students_for_class(id) do
    num_id = String.to_integer(id)
    Repo.all(Student)
    |> Enum.filter(fn i -> i.class_room_id == num_id end)

    # Repo.all(from u in Student, where: u.class_room_id == ^id)
  end
end
