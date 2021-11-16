defmodule SchoolMgt.Accounts do
  alias SchoolMgt.User
  alias SchoolMgt.Repo
  def change_user(user, params \\ %{}) do
    User.changeset(user, params)
  end

  def create_user(user_data) do
    User.changeset(%User{}, user_data)
    |> Repo.insert!()
  end

  def get_by_username(username) do
    Repo.get_by(User, username: username)
  end

  def get_user(id) do
    Repo.get(User, id)
  end
end
