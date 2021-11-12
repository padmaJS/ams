defmodule SchoolMgt.Helpers.Auth do
  def signed_in?(conn) do
    user_id = Plug.Conn.get_session(conn, :user_id)
    if user_id do
      SchoolMgt.Repo.exists?(SchoolMgt.User, id: user_id)
    end
  end
end
