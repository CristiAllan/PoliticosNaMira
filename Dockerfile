FROM ruby:2.6.3
MAINTAINER Ricardo Silva <riksilvap@gmail.com>
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /politicosnamira
WORKDIR /politicosnamira
COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN gem install bundler:2.0.2
RUN bundle install
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn
RUN yarn install --check-files
COPY . /politicosnamira

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
