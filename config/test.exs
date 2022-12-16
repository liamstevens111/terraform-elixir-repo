import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :terraform_elixir_repo, TerraformElixirRepo.Repo,
  username: "postgres",
  password: "postgres",
  hostname: System.get_env("DB_HOST") || "localhost",
  database: "terraform_elixir_repo_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :terraform_elixir_repo, TerraformElixirRepoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "RudttkqfF534l+8Ns4Sfmw7r1WfOqiDi2sz/y31N8Aq6vYIA9FNWAUW3Mwz/utn3",
  server: true

config :terraform_elixir_repo, :sql_sandbox, true

config :wallaby,
  otp_app: :terraform_elixir_repo,
  chromedriver: [headless: System.get_env("CHROME_HEADLESS", "true") === "true"],
  screenshot_dir: "tmp/wallaby_screenshots",
  screenshot_on_failure: true

# In test we don't send emails.
config :terraform_elixir_repo, TerraformElixirRepo.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
