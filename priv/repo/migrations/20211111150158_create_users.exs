defmodule SchoolMgt.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :encrypted_password, :string
      add :super_admin, :boolean, default: :false
    end
    create unique_index(:users, [:username])
  end
end
