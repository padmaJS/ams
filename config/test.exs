import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :school_mgt, SchoolMgt.Repo,
  username: "postgres",
  password: "postgres",
  database: "school_mgt_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :school_mgt, SchoolMgtWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "vnfOZUfA7e4fp5KUlyYeALXU0lLkotcgFbuvTkVjf2tVhku+0MX6+cQPwzMYX5lT",
  server: false

# In test we don't send emails.
config :school_mgt, SchoolMgt.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
