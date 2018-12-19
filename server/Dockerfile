FROM ruby:2.5.0

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install 

EXPOSE 4000 

COPY . .

CMD ["rackup", "-p 4000"]