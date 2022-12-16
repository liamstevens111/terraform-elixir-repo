defmodule TerraformElixirRepoWeb.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.Feature
      use Mimic

      import TerraformElixirRepo.Factory
      import TerraformElixirRepoWeb.Gettext

      alias TerraformElixirRepo.Repo
      alias TerraformElixirRepoWeb.Endpoint
      alias TerraformElixirRepoWeb.Router.Helpers, as: Routes

      @moduletag :feature_test
    end
  end
end
