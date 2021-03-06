VERSION=0.1.7

DESTDIR?=$(PWD)/image

prefix?=/usr/local
exec_prefix?=$(prefix)
bindir?=$(exec_prefix)/bin
datarootdir?=$(prefix)/share
datadir?=$(datarootdir)
docdir?=$(datarootdir)/doc/git-gerrit-$(VERSION)
libexecdir?=$(exec_prefix)/libexec
mandir?=$(datarootdir)/man
man1dir?=$(mandir)/man1

all:
	@printf "git-gerrit $(VERSION), a non-interactive command line interface for Gerrit\n\n"
	@printf "%-20s%-20s\n"	\
		"DESTDIR"		"$(DESTDIR)"		\
		"prefix"		"$(prefix)"			\
		"exec_prefix"	"$(exec_prefix)"	\
		"bindir"		"$(bindir)"			\
		"libexecdir"	"$(libexecdir)"		\
		"datadir"		"$(datadir)"		\
		"datarootdir"	"$(datarootdir)"	\
		"docdir"		"$(docdir)"			\
		"mandir"		"$(mandir)"			\
		"man1dir"		"$(man1dir)"		\
		""
	@$(MAKE) --no-print-directory build

clean:
	rm -f git-gerrit git-gerrit.1

build:	git-gerrit git-gerrit.1

man:	git-gerrit.1

html:	git-gerrit.1.html

git-gerrit:		git-gerrit.in
	sed -e "s/@@VERSION@@/$(VERSION)/g" -e "s|@@libexecdir@@|$(libexecdir)|g" git-gerrit.in > git-gerrit
	chmod +x git-gerrit

git-gerrit.1:	git-gerrit.1.ronn
	ronn --pipe --roff --organization="git-gerrit $(VERSION)" git-gerrit.1.ronn > $@

git-gerrit.1.html:	git-gerrit.1.ronn
	ronn --pipe --html --organization="git-gerrit $(VERSION)" git-gerrit.1.ronn > $@

install: git-gerrit git-gerrit.1
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(man1dir)
	install -m755 git-gerrit $(DESTDIR)$(bindir)/git-gerrit
	install -m644 git-gerrit.1 $(DESTDIR)$(man1dir)/git-gerrit.1

.PHONY:	all clear build install
