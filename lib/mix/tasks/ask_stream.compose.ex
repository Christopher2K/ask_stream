defmodule Mix.Tasks.AskStream.Compose do
  use Mix.Task

  @shortdoc "Run the compose command for this project"

  @impl Mix.Task
  def run(command_line_args) do
    Mix.Shell.IO.cmd("docker compose -f ./docker/docker-compose.yaml #{command_line_args}")
  end
end
