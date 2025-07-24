#!/usr/bin/env -S DOSH_DOCKERFILE=Dockerfile.rpm DOSH_DOCKER_RUN_EXTRA_OPTS="--volume ${PWD}/rpmbuild:${HOME}/rpmbuild --volume ${PWD}/github-workflows.spec:${HOME}/rpmbuild/SPECS/github-workflows.spec" dosh
set -e
rpmdev-setuptree
cd ~/rpmbuild/SPECS
rpmbuild --undefine=_disable_source_fetch -ba github-workflows.spec "$@"
rpmlint ~/rpmbuild/SPECS/github-workflows.spec ~/rpmbuild/SRPMS/github-workflows*.rpm ~/rpmbuild/RPMS/github-workflows*.rpm
