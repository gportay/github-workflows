PREFIX ?= /usr/local
VERSION ?= 5

.PHONY: all
all: helloworld

.PHONY: test
test: helloworld
	$(CURDIR)/helloworld | grep -q "^Hello World!$$"

.PHONY: version
version:
	@echo $(VERSION)

.PHONY: install
install:
	install -D -m0755 helloworld $(DESTDIR)$(PREFIX)/bin/helloworld

.PHONY: clean
clean:
	rm -f helloworld

.PHONY: deb
deb: PATH:=$(CURDIR):$(PATH)
deb: SHELL=dosh
deb: export DOSH_DOCKERFILE=Dockerfile.deb
deb:
	dpkg-buildpackage -us -uc
	lintian ../github-workflows*.deb

.PHONY: pkg
pkg: PATH:=$(CURDIR):$(PATH)
pkg: SHELL=dosh
pkg: export DOSH_DOCKERFILE=Dockerfile.pkg
pkg:
	makepkg --force --skipchecksums
	shellcheck --shell=bash --exclude=SC2034,SC2154,SC2164 PKGBUILD
	namcap PKGBUILD github-workflows*.pkg.tar*

.PHONY: rpm
rpm: PATH:=$(CURDIR):$(PATH)
rpm: SHELL=dosh
rpm: export DOSH_DOCKERFILE=Dockerfile.rpm
rpm:
	rpmbuild --undefine=dist --undefine=_disable_source_fetch -ba github-workflows.spec
	rpmlint ~/rpmbuild/SPECS/github-workflows.spec ~/rpmbuild/SRPMS/github-workflows*.rpm ~/rpmbuild/RPMS/github-workflows*.rpm

rpmbuild/SOURCES/v$(VERSION).tar.gz:
rpmbuild/SOURCES/v%.tar.gz:
	git archive --prefix github-workflows-$*/ --format tar.gz --output $@ HEAD

github-workflows-$(VERSION).tar.gz:
%.tar.gz:
	git archive --prefix $*/ --format tar.gz --output $@ HEAD
