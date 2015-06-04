DESTDIR?=build/
BINDIR?=/usr/bin
MANDIR?=/usr/share/man/man1

VERSION=0.1

all: clean man

clean:
	rm -rf $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)
	rm -f git-gerrit.1 git-gerrit.1.html

man:
	ronn --roff --organization="git-gerrit $(VERSION)" git-gerrit.1.ronn

html:
	ronn --html --organization="git-gerrit $(VERSION)" git-gerrit.1.html

install:
	mkdir -p $(DESTDIR)$(BINDIR)
	install git-gerrit $(DESTDIR)$(BINDIR)/git-gerrit
	mkdir -p $(DESTDIR)$(MANDIR)
	install git-gerrit.1 $(DESTDIR)$(MANDIR)/git-gerrit.1
