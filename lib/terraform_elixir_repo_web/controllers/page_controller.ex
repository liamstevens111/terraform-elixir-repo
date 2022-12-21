# credo:disable-for-this-file
defmodule TerraformElixirRepoWeb.PageController do
  use TerraformElixirRepoWeb, :controller
  alias Redix

  def index(conn, params) do
    {previous_value, new_value} =
      if params["redis-key"] do
        previous_value = Redix.command(:redix, ["GET", "redis_key"])
        Redix.command(:redix, ["SET", "redis-key", params["redis-key"]])
        new_value = Redix.command(:redix, ["GET", "redis_key"])
        {previous_value, new_value}
      else
        {nil, nil}
      end

    redis_endpoint = System.get_env("REDIS_ENDPOINT_ADDRESS")
    s3_bucket_name = System.get_env("AWS_S3_BUCKET_NAME")

    render(conn, "index.html",
      previous_value: previous_value,
      new_value: new_value,
      redis_endpoint: redis_endpoint,
      s3_bucket_name: s3_bucket_name
    )
  end
end
