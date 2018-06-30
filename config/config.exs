# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :weedah,
  ecto_repos: [Weedah.Repo]

# Configures the endpoint
config :weedah, WeedahWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Sz9fIqkz9PHjGUxB7FaRJQemFyZIL6BRNLluEif/AUJmOfbR+XfWeJNMvB2OPDiW",
  render_errors: [view: WeedahWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Weedah.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

  config :arc,
    storage: Arc.Storage.Local,
    virtual_host: true,
    bucket: {:system, "AWS_S3_BUCKET"}
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
