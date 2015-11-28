VERSION=0.1.6

BINDIR?=/usr/bin
MANDIR?=/usr/share/man

all: prepare man

clean:
	rm -f git-gerrit.1
	[ -f "git-gerrit" ] && [ -f "git-gerrit.orig" ] && rm -f git-gerrit && mv git-gerrit.orig git-gerrit || true

prepare:
	cp git-gerrit git-gerrit.orig
	sed -e "s/@@VERSION@@/$(VERSION)/g" -i git-gerrit

man:
	ronn --pipe --roff --organization="git-gerrit $(VERSION)" git-gerrit.1.ronn > git-gerrit.1

install: prepare man
	mkdir -p $(DESTDIR)$(BINDIR)
	install git-gerrit $(DESTDIR)$(BINDIR)/git-gerrit
	mkdir -p $(DESTDIR)$(MANDIR)/man1
	install git-gerrit.1 $(DESTDIR)$(MANDIR)/man1/git-gerrit.1

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/git-gerrit
	rm -f $(DESTDIR)$(MANDIR)/man1/git-gerrit.1
