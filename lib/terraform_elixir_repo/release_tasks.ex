# credo:disable-for-this-file CompassCredoPlugin.Check.DoSingleExpression
defmodule TerraformElixirRepo.ReleaseTasks do
  @app :terraform_elixir_repo

  def migrate do
    load_app()

    for repo <- repos() do
      schema_migrations = Ecto.Migrator.migrations_path(repo, "migrations")
      data_migrations = Ecto.Migrator.migrations_path(repo, "data_migrations")

      {:ok, _, _} =
        Ecto.Migrator.with_repo(
          repo,
          &Ecto.Migrator.run(&1, [schema_migrations, data_migrations], :up, all: true)
        )
    end
  end

  def rollback(repo, version) do
    load_app()
    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  def create_db(repo) do
    load_app()

    repo.__adapter__.storage_up(repo.config)
  end

  defp repos do
    Application.fetch_env!(@app, :ecto_repos)
  end

  defp load_app do
    Application.ensure_all_started(:ssl)

    Application.load(@app)
  end
end
