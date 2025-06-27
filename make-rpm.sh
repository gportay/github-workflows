#!/usr/bin/env -S dosh --dockerfile Dockerfile.fedora --working-directory ${HOME}/rpmbuild/SPECS
exec rpmbuild -bs *.spec
#exec rpmbuild -ba *.spec
