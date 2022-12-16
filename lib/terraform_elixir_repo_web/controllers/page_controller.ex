# credo:disable-for-this-file CompassCredoPlugin.Check.DoSingleExpression
defmodule TerraformElixirRepoWeb.PageController do
  use TerraformElixirRepoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
