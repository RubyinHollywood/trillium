# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :trillium,
  ecto_repos: [Trillium.Repo]

# Configures the endpoint
config :trillium, Trillium.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OMmG1yqTpgWw1+BXTo8aZJZayhiIOma1Cy0gS4B46J/iCjZsj9DAweg65Al2SjJH",
  render_errors: [view: Trillium.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Trillium.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
