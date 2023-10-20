<<<<<<< HEAD
#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
=======
#!/bin/bash
set -e

# Install dependencies
bundle install

# Run database migrations
bundle exec rake db:migrate

# Precompile assets
bundle exec rake assets:precompile
>>>>>>> 2feaa42366a654c0ed15389e37da25a0f067a429
