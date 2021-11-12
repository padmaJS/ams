defmodule SchoolMgt.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :encrypted_password, :string
    end
    create unique_index(:users, [:username])
  end
end
