defmodule SchoolMgt.ClassRooms do
  alias SchoolMgt.Repo
  alias SchoolMgt.ClassRooms.Room

  def list_class() do
    Repo.all(Room)
  end

  def change_class(class, attr \\ %{}) do
    Room.changeset(class, attr)
  end

  def create_class(class) do
    Room.changeset(%Room{}, class)
    |> Repo.insert!()
  end

  def get_class(id) do
    Repo.get!(Room, id)
  end

  def update_class(id, attr) do
    Repo.get(Room, id)
    |> Room.changeset(attr)
    |> Repo.update!()
  end

  def delete_class(id) do
    Repo.get!(Room, id)
    |> Repo.delete!()
  end
end
