# Copyright (c) 2026 Gaël PORTAY
# SPDX-License-Identifier: LGPL-2.1-or-later
FROM homebrew/brew:latest
ARG DOSH_UID=1000
ARG DOSH_GID=1000
USER root
RUN chown -R "$DOSH_UID:$DOSH_GID" /home/linuxbrew
USER linuxbrew
ENV HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_ANALYTICS=1
CMD ["/bin/bash", "-c", "brew tap-new --no-git local/github-workflows && cp Formula/*.rb \"$(brew --repository local/github-workflows)/Formula/\" && brew install --build-bottle local/github-workflows/github-workflows-helloworld"]
