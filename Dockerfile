# Use official Ruby's default image as a base
FROM ruby:2.5

# Create an environment variable for our default build path
ENV BUILD_PATH /usr/src/api

# Create BUILD_PATH if it does not exist
RUN mkdir -p $BUILD_PATH

# Set BUILD_PATH as the main directory
WORKDIR $BUILD_PATH

# Copy Gemfile and Gemfile.lock to WORKDIR
COPY Gemfile Gemfile.lock ./

# Install dependencies specified by Gemfile and Gemfile.lock
RUN bundle install

# Copy the remaining code from host's current dir to WORKDIR
COPY . .

# Command appended to all other commands
ENTRYPOINT [ "bundle", "exec" ]