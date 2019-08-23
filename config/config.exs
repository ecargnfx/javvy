# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :javvy, Javvy.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "javvy_repo",
  username: "grace",
  password: "grace",
  hostname: "localhost"


# General application configuration
config :javvy,
  ecto_repos: [Javvy.Repo]

# Configures the endpoint
config :javvy, JavvyWeb.Endpoint,
  url: [host: "localhost"],
  live_view: [signing_salt: "fvoFfy/McieiwEzIiimJQ3X5JYATGfNF"],
  secret_key_base: "wTPrVkM5QMwMEl5gtTW+D0mIFKchulDNpy7Abq8o4+mZ+T7crt1vv58W9CCeIfTv",
  render_errors: [view: JavvyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Javvy.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
