# credo:disable-for-this-file
defmodule TerraformElixirRepoWeb.PageController do
  use TerraformElixirRepoWeb, :controller
  alias Redix

  def index(conn, params) do
    {previous_value, new_value} =
      if params["redis-key"] do
        {_, previous_value} = Redix.command(:redix, ["GET", "redis-key"])
        Redix.command(:redix, ["SET", "redis-key", params["redis-key"]])
        {_, new_value} = Redix.command(:redix, ["GET", "redis-key"])
        {previous_value, new_value}
      else
        {nil, nil}
      end

    redis_endpoint = System.get_env("REDIS_ENDPOINT_ADDRESS")
    s3_bucket_name = System.get_env("AWS_S3_BUCKET_NAME")
    some_random_env_variable = System.get_env("some_random_env_variable")
    IO.inspect(some_random_env_variable)

    render(conn, "index.html",
      previous_value: previous_value || "No redis-key in query string",
      new_value: new_value || "No redis-key in query string",
      redis_endpoint: redis_endpoint,
      s3_bucket_name: s3_bucket_name,
      some_random_env_variable: some_random_env_variable
    )
  end
end
