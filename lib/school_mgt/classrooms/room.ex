defmodule SchoolMgt.ClassRooms.Room do
  import Ecto.Changeset
  use Ecto.Schema

  schema "class_rooms" do
    field :name, :string
    field :section, :string
    has_many :students, SchoolMgt.Students.Student
  end

  def changeset(class, attr) do
    class
    |> cast(attr, [:name, :section])
    |> validate_required([:name, :section])
  end
end
