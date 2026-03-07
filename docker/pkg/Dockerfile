# Copyright (c) 2025-2026 Gaël PORTAY
# SPDX-License-Identifier: LGPL-2.1-or-later
FROM archlinux:base-devel
RUN pacman -Sy --noconfirm git namcap shellcheck
CMD ["runuser", "-u", "nobody", "--", "makepkg", "--force", "--skipchecksums"]
