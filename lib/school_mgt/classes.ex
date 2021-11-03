defmodule SchoolMgt.Classes do
  alias SchoolMgt.Repo
  alias SchoolMgt.Classes.Class

  def list_class() do
    Repo.all(Class)
  end

  def change_class(class, attr \\ %{}) do
    Class.changeset(class, attr)
  end

  def create_class(class) do
    Class.changeset(%Class{}, class)
    |> Repo.insert!()
  end

  def get_class(id) do
    Repo.get!(Class, id)
  end

  def update_class(id, attr) do
    Repo.get(Class, id)
    |> Class.changeset(attr)
    |> Repo.update!()
  end

  def delete_class(id) do
    Repo.get!(Class, id)
    |> Repo.delete!()
  end
end
