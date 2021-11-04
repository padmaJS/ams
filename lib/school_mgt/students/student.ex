defmodule SchoolMgt.Students.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :name, :string
    field :age, :integer
    belongs_to :room, SchoolMgt.ClassRooms.Room
  end

  def changeset(student, attr) do
    student
    |> cast(attr, [:name, :age])
    |> validate_required([:name])
  end
end
