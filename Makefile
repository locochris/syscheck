BUSHEL    ?= syscheck
PREFIX    ?= /usr/local
BINDIR    ?= $(PREFIX)/bin

all: $(BUSHEL)

release:
	cat install.sh | sed "s/VERSION=.*/VERSION=`cat VERSION`/" > install.sh
	git add install.sh VERSION
	[ -n "`git status --porcelain`" ] && git commit -m "Release `cat VERSION`" || true
	git push origin master
	git tag `cat VERSION`
	git push --tags
	@read -p "Enter new version number (currently `cat VERSION`)> " version; \
	echo $$version > VERSION
	git add VERSION
	git commit -m "Ready for new release"

install:
	mkdir -p $(BINDIR)
	install bin/$(BUSHEL) $(BINDIR)/

uninstall:
	rm -f $(BINDIR)/$(BUSHEL)
