FROM elixir:latest

WORKDIR /app

COPY . .

EXPOSE 4000

RUN mix local.hex --force
CMD mix deps.get && mix run --no-halt
