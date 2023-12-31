# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :firechat,
  ecto_repos: [Firechat.Repo]

# Configures the endpoint
config :firechat, FirechatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4cvZT+aN8pbx67wwLJ+2EZtZMcBwHRnpgDyZ7BYXKSCaBRUeGeQ+2FFvOrJj15Uo",
  render_errors: [view: FirechatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Firechat.PubSub,
  live_view: [signing_salt: "x6QlR3IP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
