PREFIX ?= /usr/local
VERSION ?= 4

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

.PHONY: debian 
debian:
	debuild -us -uc
