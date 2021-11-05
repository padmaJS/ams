defmodule SchoolMgt.Students.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :name, :string
    field :age, :integer
    belongs_to :class_room, SchoolMgt.ClassRooms.ClassRoom
  end

  def changeset(student, attr) do
    student
    |> cast(attr, [:name, :age, :class_room_id])
    |> validate_required([:name])
  end
end
