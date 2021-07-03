FROM ruby:2.7.1

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . /app

# Execute this script every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]