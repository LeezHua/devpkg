PREFIX ?= /usr/local

CFLAGS = -ggdb -Wall \
	-I$(PREFIX)/apr/include/apr-1
LDFLAGS += -L$(PREFIX)/apr/lib -lapr-1 -pthread -laprutil-1

OBJS = \
	bstrlib.o \
	db.o \
	shell.o \
	commands.o

all : devpkg test

devpkg : $(OBJS) main.o
	cc $(LDFLAGS) $(OBJS) main.o -o devpkg

test : $(OBJS) test.o
	cc $(LDFLAGS) $(OBJS) test.o -o test

install : all
	install -d $(DESTDIR)/$(PREFIX)/bin/
	install devpkg $(DESTDIR)/$(PREFIX)/bin/

clean :
	-rm -f *.o
	-rm -f devpkg test