FROM ruby:2.4.2-slim

# Common dependencies
# libpq-dev - postgres dependency
# openssh-client - using capistrano inside docker container

RUN apt-get update -qq \
  && apt-get install -yq --no-install-recommends \
    build-essential \
    glib-2.0 \
    libpq-dev \
    nodejs \
    openssh-client \
    postgresql-client \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

WORKDIR /rails_new

COPY Gemfile /rails_new/Gemfile
COPY Gemfile.lock /rails_new/Gemfile.lock

RUN bundle install
