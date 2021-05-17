#!/bin/sh
# Exit immediately if a pipeline returns a non-zero status.
set -e

echo "Starting Jekyll build action"
cd "$GITHUB_WORKSPACE"

if [ -n "$INPUT_PRE_BUILD_COMMANDS" ]; then
	echo "Executing pre-build commands"
	eval "$INPUT_PRE_BUILD_COMMANDS"
fi

if [ -n "${INPUT_JEKYLL_ENV}" ]; then
	echo "Building for environment: ${INPUT_JEKYLL_ENV}"
else
	echo "Building for default environment: production"
	INPUT_JEKYLL_ENV="production"
fi

echo "Setting bundler path"
bundle config path "vendor/bundle"

echo "Installing project dependencies..."
bundle install

echo "Building website..."
JEKYLL_ENV=${INPUT_JEKYLL_ENV} bundle exec jekyll build ${INPUT_JEKYLL_BUILD_OPTIONS}
echo "Jekyll build done"
