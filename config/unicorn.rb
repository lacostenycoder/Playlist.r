web: bundle exec unicorn start -p $PORT
worker: bundle exec sidekiq
