#!/usr/bin/env -S dosh --dockerfile Dockerfile.archlinux
exec runuser -u nobody -- makepkg "$@"
