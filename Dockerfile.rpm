# Copyright (c) 2025-2026 Gaël PORTAY
# SPDX-License-Identifier: LGPL-2.1-or-later
FROM fedora:43
RUN dnf install -y gcc git make rpmdevtools rpmlint
CMD ["rpmbuild", "--undefine=_disable_source_fetch", "-ba", "github-workflows.specs"]
