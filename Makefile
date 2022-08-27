.PHONY: build
build:
# Use -gnata so that preconditions work as an additional verification layer.
	gprbuild -p -s -gnata -P default.gpr

.PHONY: tests
tests:
	gprbuild -p -s -gnata -P default-tests.gpr
