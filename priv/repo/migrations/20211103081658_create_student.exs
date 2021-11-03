defmodule SchoolMgt.Repo.Migrations.CreateStudent do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string
      add :age, :integer
    end
  end
end
