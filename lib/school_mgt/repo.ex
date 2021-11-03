defmodule SchoolMgt.Repo do
  use Ecto.Repo,
    otp_app: :school_mgt,
    adapter: Ecto.Adapters.Postgres
end
