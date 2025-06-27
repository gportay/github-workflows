PREFIX ?= /usr/local

.PHONY: all
all: helloworld

.PHONY: test
test: helloworld
	$(CURDIR)/helloworld | grep -q "^Hello World!$$"

.PHONY: install
install:
	install -D -m0755 helloworld $(DESTDIR)$(PREFIX)/bin/helloworld

.PHONY: clean
clean:
	rm -f helloworld

.PHONY: debian 
debian:
	debuild -us -uc
