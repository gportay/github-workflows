#!/usr/bin/env -S DOSH_DOCKERFILE=Dockerfile.deb dosh
set -e
dpkg-buildpackage -us -uc "$@"
lintian ../github-workflows*.deb
