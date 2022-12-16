defmodule TerraformElixirRepoWeb.LivenessRequestTest do
  use TerraformElixirRepoWeb.ConnCase, async: true

  test "returns 200", %{conn: conn} do
    conn =
      get(
        conn,
        "#{Application.get_env(:terraform_elixir_repo, TerraformElixirRepoWeb.Endpoint)[:health_path]}/liveness"
      )

    assert response(conn, :ok) =~ "alive"
  end
end
