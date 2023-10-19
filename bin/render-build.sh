#!/bin/bash
set -e

# Install dependencies
bundle install

# Run database migrations
bundle exec rake db:migrate

# Precompile assets
bundle exec rake assets:precompile
