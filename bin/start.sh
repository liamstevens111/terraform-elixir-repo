#!/bin/sh

bin/terraform_elixir_repo eval "TerraformElixirRepo.ReleaseTasks.migrate()"

bin/terraform_elixir_repo start
