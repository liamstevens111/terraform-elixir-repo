defmodule TerraformElixirRepoWeb.HomePage.ViewHomePageTest do
  use TerraformElixirRepoWeb.FeatureCase

  feature "view home page", %{session: session} do
    visit(session, Routes.page_path(TerraformElixirRepoWeb.Endpoint, :index))

    assert_has(session, Query.text("Welcome to Phoenix!"))
  end
end
