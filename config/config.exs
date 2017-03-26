# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :twitter_client,
  ecto_repos: [TwitterClient.Repo]

# Configures the endpoint
config :twitter_client, TwitterClient.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KpyF8RBOkFcr9vJGT9nnF1hLNgtAtyNtS7lnp/905b0vDLul7AH+sB41jLVNvtnV",
  render_errors: [view: TwitterClient.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TwitterClient.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"