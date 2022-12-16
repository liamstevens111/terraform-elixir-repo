defmodule TerraformElixirRepoWeb.RouterHelper do
  def health_path,
    do: Application.get_env(:terraform_elixir_repo, TerraformElixirRepoWeb.Endpoint)[:health_path]
end
