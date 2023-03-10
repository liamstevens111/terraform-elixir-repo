# terraform-elixir-repo

=======
[![Build Status](CI_BADGE_URL goes here)](REPO_URL goes here)

## Introduction

Example repository to use with Terraform infrastructure to deploy the application to `ECR` for use with ECS, and to test connections to AWS S3, RDS, and Elasticache. Here is it running:

<img width="1249" alt="Screenshot 2022-12-22 at 13 52 17" src="https://user-images.githubusercontent.com/8955671/209076796-b33e521a-7f3f-4dab-980a-091d4cc1eead.png">


## Project Setup

### Erlang & Elixir

- Erlang 25.0.4

- Elixir 1.14.0

### Node

- Node 16.15.0

- Recommended version manager.

  - [asdf](https://github.com/asdf-vm/asdf)
  - [asdf-erlang](https://github.com/asdf-vm/asdf-erlang)
  - [asdf-elixir](https://github.com/asdf-vm/asdf-elixir)

  - [asdf-node](https://github.com/asdf-vm/asdf-node)


### Development

- Install [Docker for Mac](https://docs.docker.com/docker-for-mac/install/)

- Setup and boot the Docker containers:

  ```sh
  make docker_setup
  ```

- Install Elixir dependencies:

  ```sh
  mix deps.get
  ```

- Install Node dependencies:

  ```sh
  npm install --prefix assets
  ```

- Install `chromedriver` for Wallaby browser tests

  Homebrew

  ```sh
  brew install --cask chromedriver
  ```

  Debian/Ubuntu

  ```sh
  brew install --cask chromedriver
  ```

- Setup the databases:

  ```sh
  mix ecto.setup
  ```

- Start the Phoenix app

  ```sh
  iex -S mix phx.server
  ```

- Run all tests:

  ```sh
  mix test
  ```

- Run tests with `watch` option:

  ```sh
  mix test.interactive # Watch the whole test suite

  mix test.interactive test_file_path # Watch a specific test file

  mix test.interactive test_file_path:line_number # Watch a specific test line number
  ```

- Run all lint:

  ```sh
  mix codebase
  ```

- Fix all lint:

  ```sh
  mix codebase.fix
  ```

- Test coverage:

  ```sh
  mix coverage
  ```

### Production

- Build Docker image

  ```sh
  docker-compose build
  ```

### CI/CD

The project relies entirely on [Github Actions](https://github.com/features/actions) for CI/CD via multiple workflows located under the [`.github/workflows/`](.github/workflows) directory.
Please check out the [`.github/workflows/README.md`](.github/workflows/README.md) file for further instructions.
