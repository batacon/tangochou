FROM ruby:3.2.2-alpine

RUN apk add --no-cache \
  bash \
  postgresql-client \
  postgresql-dev \
  nodejs \
  tzdata \
  build-base \
  libxml2-dev \
  libxslt-dev

RUN mkdir /tangochou
WORKDIR /tangochou

COPY Gemfile /tangochou/Gemfile
COPY Gemfile.lock /tangochou/Gemfile.lock
RUN bundle install
COPY . /tangochou

CMD ["rails", "server", "-b", "0.0.0.0"]
