defmodule Kodaline.Repo do
  use Ecto.Repo,
    otp_app: :kodaline,
    adapter: Ecto.Adapters.Postgres
end
