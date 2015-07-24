CC=gcc
CFLAGS=-g -Wall -Wextra -Werror
ifeq ($(DEBUG),1)
 CFLAGS+=-O0 -DDEBUG -g
else
 CFLAGS+=-O3 -g
endif

ifeq ($(TEST),1)
 CFLAGS+=-DTEST
endif

#LDLIBS=-lrt -lpthread

PROGS = kod
LISTINGS = kod.s

all:  $(LISTINGS)

kod.s: kod.o
	objdump -d $< > $@

clean:
	rm -f $(ALL) $(PROGS:%=%.o) $(LISTINGS)
