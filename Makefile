#
# Use this shell to interpret shell commands, & pass its value to sub-make
#
export SHELL = /bin/sh
LASTTAG := $(shell git describe --tags --dirty --always | cut -d- -f1)
COUNT := $(shell git rev-list --count HEAD)
export VERSION := $(shell if test -n "$(TAG)"; then v=$(TAG); else v=$(LASTTAG).post$(COUNT); fi; echo "$${v}")
#
# This is the first target so it is the default.
#
all: legacysurvey-$(VERSION).tar.gz
#
# This is a message to make that these targets are 'actions' not files.
#
.PHONY: all test clean
#
# Dependencies
#
output:
	nikola build
	- $(RM) output/assets/js/jquery.js output/assets/js/jquery.min.js output/assets/js/jquery.min.map

legacysurvey-$(VERSION): output
	mv output legacysurvey-$(VERSION)

legacysurvey-$(VERSION).tar: legacysurvey-$(VERSION)
	tar -cf legacysurvey-$(VERSION).tar legacysurvey-$(VERSION)

legacysurvey-$(VERSION).tar.gz: legacysurvey-$(VERSION).tar
	gzip -9 legacysurvey-$(VERSION).tar
#
# Make sure the version string works.
#
test:
	@ echo "legacysurvey-$(VERSION).tar.gz"
#
#
#
# @ if test -n "$(TAG)"; then v=$(TAG); else v=$(LASTTAG).post$(COUNT); fi; \
# 	echo "#define VERSION_STRING \"$$v\"" > version.hpp
#
#
#
clean:
	git clean -f -d -x
