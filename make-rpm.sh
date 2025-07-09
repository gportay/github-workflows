#!/usr/bin/env -S "DOSH_DOCKERFILE=Dockerfile.rpm" dosh
set -e
rpmdev-setuptree
rpmbuild --undefine=dist --undefine=_disable_source_fetch -ba github-workflows.spec "$@"
rpmlint ~/rpmbuild/SPECS/github-workflows.spec ~/rpmbuild/SRPMS/github-workflows*.rpm ~/rpmbuild/RPMS/github-workflows*.rpm
