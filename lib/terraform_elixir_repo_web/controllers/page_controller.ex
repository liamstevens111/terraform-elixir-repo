# credo:disable-for-this-file
defmodule TerraformElixirRepoWeb.PageController do
  use TerraformElixirRepoWeb, :controller
  alias Redix

  def index(conn, _params) do
    Redix.command(:redix, ["PING"])
    Redix.command(:redix, ["SET", "mykey", "foo"])
    result = Redix.command(:redix, ["GET", "mykey"])
    IO.inspect(result)
    IO.puts("result has finshed")
    inspect(result)

    output = System.get_env("REDIS_ENDPOINT_ADDRESS")
    IO.inspect(output)

    render(conn, "index.html")
  end
end
