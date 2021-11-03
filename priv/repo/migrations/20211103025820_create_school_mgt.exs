defmodule SchoolMgt.Repo.Migrations.CreateSchoolMgt do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :name, :string
      add :section, :string
    end
  end
end
