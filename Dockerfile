FROM ruby:3-alpine

LABEL author="Luis Hankel"
LABEL version="1.0.0"

# Add build tools to allow building ruby gems
RUN apk add --no-cache git build-base

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
