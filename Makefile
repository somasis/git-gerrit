VERSION=0.1.4.1

DESTDIR?=build/
BINDIR?=/usr/bin
DOCDIR?=/usr/share/doc/git-gerrit
MANDIR?=/usr/share/man/man1

all: prepare man html

clean:
	rm -rf $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)
	rm -f git-gerrit.1 git-gerrit.1.html
	mv git-gerrit.orig git-gerrit

prepare:
	cp git-gerrit git-gerrit.orig
	sed -e "s/@@VERSION@@/$(VERSION)/g" -i git-gerrit

man:
	ronn --roff --organization="git-gerrit $(VERSION)" git-gerrit.1.ronn

html:
	ronn --html --organization="git-gerrit $(VERSION)" git-gerrit.1.ronn

install:
	mkdir -p $(DESTDIR)$(BINDIR)
	install git-gerrit $(DESTDIR)$(BINDIR)/git-gerrit
	mkdir -p $(DESTDIR)$(MANDIR)
	install git-gerrit.1 $(DESTDIR)$(MANDIR)/git-gerrit.1
	mkdir -p $(DESTDIR)$(DOCDIR)
	install git-gerrit.1.html $(DESTDIR)$(DOCDIR)/git-gerrit.1.html
