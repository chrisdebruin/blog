# Elixir 1.6.1: https://hub.docker.com/_/elixir/
FROM elixir:1.6.1

ENV DEBIAN_FRONTEND=noninteractive

# Install rebar
RUN mix local.hex --force \
    && mix local.rebar --force

# Install the Phoenix framework itself
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

# install Node.js (>= 8.0.0) and NPM in order to satisfy brunch.io dependencies
# See https://hexdocs.pm/phoenix/installation.html#node-js-5-0-0
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y inotify-tools nodejs

WORKDIR /app
ADD . /app

