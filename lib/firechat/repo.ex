defmodule Firechat.Repo do
  use Ecto.Repo,
    otp_app: :firechat,
    adapter: Ecto.Adapters.Postgres
end
