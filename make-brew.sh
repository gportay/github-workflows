#!/usr/bin/env -S DOSH_DOCKERFILE=docker/brew/Dockerfile dosh --no-doshrc
set -e
brew tap-new --no-git local/github-workflows
cp Formula/github-workflows-helloworld.rb "$(brew --repository local/github-workflows)/Formula/"
brew install --build-bottle "$@" local/github-workflows/github-workflows-helloworld
brew test local/github-workflows/github-workflows-helloworld
brew bottle --json local/github-workflows/github-workflows-helloworld
brew style Formula/github-workflows-helloworld.rb
brew audit --strict local/github-workflows/github-workflows-helloworld
