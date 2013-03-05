BUSHEL    ?= syscheck
PREFIX    ?= /usr/local
BINDIR    ?= $(PREFIX)/bin

all: $(BUSHEL)

release:
	sed -i '' "s/^VERSION=.*/VERSION=`cat VERSION`/" install.sh
	git add install.sh VERSION
	[ -n "`git status --porcelain`" ] && git commit -m "Release `cat VERSION`" || true
	git push origin master
	$(eval current_version=$(shell cat VERSION))
	git tag $(current_version)
	git push --tags
	@read -p "Enter new version number (currently $(current_version))> " new_version; \
	cat CHANGELOG.md | sed "s/^## $(current_version) Unreleased/## $$new_version Unreleased== *==## $(current_version) ($(shell date +'%b %e %Y'))/" | tr "=" "\n" > CHANGELOG.md.new; \
	mv CHANGELOG.md.new CHANGELOG.md; \
	echo $$new_version > VERSION
	git add VERSION CHANGELOG.md
	git commit -m "Ready for new release"
	git push origin master

install:
	mkdir -p $(BINDIR)
	install bin/$(BUSHEL) $(BINDIR)/

uninstall:
	rm -f $(BINDIR)/$(BUSHEL)
