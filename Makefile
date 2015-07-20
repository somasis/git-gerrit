VERSION=0.1.2

DESTDIR?=build/
BINDIR?=/usr/bin
DOCDIR?=/usr/share/doc/git-gerrit
MANDIR?=/usr/share/man/man1

all: man html

clean:
	rm -rf $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)
	rm -f git-gerrit.1 git-gerrit.1.html

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
