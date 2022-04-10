defmodule Kodaline.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Kodaline.Repo,
      # Start the Telemetry supervisor
      KodalineWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Kodaline.PubSub},
      # Start the Endpoint (http/https)
      KodalineWeb.Endpoint
      # Start a worker by calling: Kodaline.Worker.start_link(arg)
      # {Kodaline.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kodaline.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KodalineWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
