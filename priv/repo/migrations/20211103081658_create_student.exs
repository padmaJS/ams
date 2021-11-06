defmodule SchoolMgt.Repo.Migrations.CreateStudent do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string
      add :age, :integer
      add :class_room_id, references(:class_rooms)
    end
    create unique_index(:students, [:name])
  end
end
