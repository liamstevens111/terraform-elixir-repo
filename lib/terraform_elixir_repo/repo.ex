defmodule TerraformElixirRepo.Repo do
  use Ecto.Repo,
    otp_app: :terraform_elixir_repo,
    adapter: Ecto.Adapters.Postgres
end
