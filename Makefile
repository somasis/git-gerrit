BINDIR?=/usr/bin

all: install

install:
	mkdir -p $(DESTDIR)$(BINDIR)
	install git-gerrit $(DESTDIR)$(BINDIR)/git-gerrit

