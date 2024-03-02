prefix=/usr
bindir=$(prefix)/bin
mandir=$(prefix)/share/man

SRCS= ealloc.c hash.c rcorder.c
OBJS= $(SRCS:.c=.o)

LIBS = -lbsd
CPPFLAGS = -D'__RCSID(x)=' -DORDER -I./compat

INSTALL = install

all: rcorder

install: install-bin install-man

install-bin: rcorder
	$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 rcorder $(DESTDIR)$(bindir)/rcorder

install-man: rcorder.8
	$(INSTALL) -d -m 755 $(DESTDIR)$(mandir)/man8
	$(INSTALL) -m 644 rcorder.8 $(DESTDIR)$(mandir)/man8/rcorder.8

rcorder: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS)

clean:
	rm -f $(OBJS) rcorder
