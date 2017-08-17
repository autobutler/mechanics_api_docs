FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential nodejs

WORKDIR /usr/src/app

ADD Gemfile* /usr/src/app/

RUN gem install bundler && bundle install

CMD ["bundle", "exec", "middleman", "server"]
