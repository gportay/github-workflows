.PHONY: all
all: helloworld

.PHONY: test
test: helloworld
	$(CURDIR)/helloworld | grep -q "^Hello World!$$"

.PHONY: clean
clean:
	rm -f helloworld
