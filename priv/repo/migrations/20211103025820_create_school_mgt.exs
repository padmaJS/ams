defmodule SchoolMgt.Repo.Migrations.CreateSchoolMgt do
  use Ecto.Migration

  def change do
    create table(:class) do
      add :class_number, :integer
      add :section, :string
    end
  end
end
