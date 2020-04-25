#!/bin/sh

adduser -D railsuser
apk add --update --no-cache \
      bash \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python \
      rsync \
      tzdata \
      vim \
      yarn

gem install rails

rails new . --database=postgresql --webpack=stimulus --skip-coffee

bundle add stimulus_reflex
bundle exec rails stimulus_reflex:install

chown -R railsuser:railsuser .
