defmodule TerraformElixirRepo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TerraformElixirRepo.Repo,
      # Start the Telemetry supervisor
      TerraformElixirRepoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TerraformElixirRepo.PubSub},
      {Redix, {"redis://#{System.get_env("REDIS_ENDPOINT_ADDRESS")}", [name: :redix]}},
      # Start the Endpoint (http/https)
      TerraformElixirRepoWeb.Endpoint
      # Start a worker by calling: TerraformElixirRepo.Worker.start_link(arg)
      # {TerraformElixirRepo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TerraformElixirRepo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TerraformElixirRepoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
