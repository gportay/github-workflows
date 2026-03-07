# Copyright (c) 2025-2026 Gaël PORTAY
# SPDX-License-Identifier: LGPL-2.1-or-later
FROM debian:trixie
ENV DPKG_FRONTEND=noninteractive
RUN apt-get -y update && apt-get -y install build-essential debhelper devscripts
CMD ["dpkg-buildpackage", "-us", "-uc"]
