FROM elixir:1.4.2
MAINTAINER Kyle Anderson <kyleaa@gmail.com>

RUN mix local.hex --force && mix hex.info && mix local.rebar --force
COPY . /src/app
WORKDIR /src/app

# We're building prod stuff...
ENV MIX_ENV prod
ENV PORT 4000

EXPOSE 4000

RUN mix deps.get && mix deps.compile && mix compile
RUN mix phoenix.digest
CMD ["/src/app/phoenix.sh"]
