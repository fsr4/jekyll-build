# jekyll-build
A simple GitHub Action to build a Jekyll site, heavily inspired by https://github.com/helaili/jekyll-action

This action basically runs bundle install followed by jekyll build for the project it's used on. Requires checking out the project first using the checkout action.

## Usage
````yml
name: Jekyll Build

on: [push]

jobs:
  jekyll:
    runs-on: ubuntu-16.04
    steps:
      - uses: actions/checkout@v2

      # Recommended: Use cache action to cache the installed gems for the project
      - uses: actions/cache@v2
        with:
          path: vendor/bundle
          key: ${{ runner.os }}-gems-${{ hashFiles('**/Gemfile') }}
          restore-keys: |
            ${{ runner.os }}-gems-

      - uses: fsr4/jekyll-build@v1
        with:
          jekyll_env: production
          jekyll_build_options: --verbose
          pre_build_commands: |
            pwd
````

### Input variables
* jekyll_env - Specifies the environment to build the website for
* jekyll_build_options - Additional options for the jekyll build command (see [the Jekyll documentation](https://jekyllrb.com/docs/configuration/options/#build-command-options))
* pre_build_commands - Shell commands to execute before starting the build process. May be used to install additional dependencies.
