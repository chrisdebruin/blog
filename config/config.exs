# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :blog,
  ecto_repos: [Blog.Repo]

# Configures the endpoint
config :blog, Blog.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8F03H28jWi8BR9Ml3ZKnpesodkAAxK+8g7bSnf/8vbg9szfMKYN9M9KXqeNogxcF",
  render_errors: [view: Blog.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Blog.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :blog, Blog.Gettext, default_locale: "nl_NL"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
