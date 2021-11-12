defmodule SchoolMgt.User do
  import Ecto.Changeset
  use Ecto.Schema

  schema "users" do
    field :username, :string
    field :encrypted_password, :string
  end

  def changeset(user, params) do
    user
    |> cast(params, [:username, :encrypted_password])
    |> validate_required([:username, :encrypted_password])
    |> unique_constraint(:username)
    |> update_change(:encrypted_password, &Bcrypt.hash_pwd_salt/1)
  end
end
