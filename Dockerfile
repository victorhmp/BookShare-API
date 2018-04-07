################################################################################
#                                  BASE IMAGE                                  #
################################################################################

# Use official Ruby's alpine image as base
FROM ruby:2.5-alpine AS base

# Create API_PATH if it doesn't exist and set it as the working dir
ENV API_PATH=/usr/src/api
WORKDIR $API_PATH

# Define base environment variables for the system
ENV BUNDLE_PATH="vendor/bundle" \
    PATH="$API_PATH/bin:$PATH"

# Define base environment variables for the API
ENV HOST=0.0.0.0 \
    PORT=3000

# Expose default port to connect with the service
EXPOSE $PORT

###############################################################################
#                               DEVELOPMENT IMAGE                              #
################################################################################

# Use base image to create the development image
FROM base AS development

# Set development environment variables
ENV RAILS_ENV=development

# Update and install packages
RUN apk add --update \
      build-base \
      postgresql-dev \
      tzdata \
    && rm -rf /var/cache/apk/*

# Copy Gemfile and Gemfile.lock and install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the application code to the installation path
COPY . .

# Define default command to execute when running the container
CMD [ "rails", "server" ]

################################################################################
#                               PRODUCTION IMAGE                               #
################################################################################

# Use base image to create the production image
FROM base AS production

# Set production environment variables
ENV RAILS_ENV=production

# Update and install packages
RUN apk add --update \
      libressl-dev \
      postgresql-libs \
      tzdata \
    && rm -rf /var/cache/apk/*

# Copy code from the development container
COPY --from=development $API_PATH/./ ./

# Remove development dependencies
RUN bundle install --clean --frozen --without development test

# Define default command to execute when running the container
CMD [ "rails", "server" ]