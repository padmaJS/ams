defmodule SchoolMgt.Repo.Migrations.CreateSchoolMgt do
  use Ecto.Migration

  def change do
    create table(:class_rooms) do
      add :name, :string
      add :section, :string
    end
  end
end
