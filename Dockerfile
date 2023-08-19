FROM ruby:3.2.2

RUN apt update -qq && apt install -y postgresql-client build-essential libpq-dev nodejs
RUN mkdir /tangochou
WORKDIR /tangochou

COPY Gemfile /tangochou/Gemfile
COPY Gemfile.lock /tangochou/Gemfile.lock
RUN bundle install
COPY . /tangochou

CMD ["rails", "server", "-b", "0.0.0.0"]
