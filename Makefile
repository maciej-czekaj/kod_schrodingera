#CROSS_COMPILE=aarch64-thunderx-linux-gnu-

CC=$(CROSS_COMPILE)gcc
LD=$(CC)
OBJDUMP=$(CROSS_COMPILE)objdump

CFLAGS=-g -Wall -Wextra -Werror
ifeq ($(DEBUG),1)
 CFLAGS+=-O0 -DDEBUG -g
else
 CFLAGS+=-O3 -g -fno-tree-vectorize -fno-unroll-loops
endif

ifeq ($(TEST),1)
 CFLAGS+=-DTEST
endif

#LDLIBS=-lrt -lpthread

PROGS = kod
LISTINGS = kod.s kod.ll cfg.main.dot
OBJS = kod.o glob.o

all:  $(LISTINGS)

kod: $(OBJS)

kod.s: kod
	$(OBJDUMP) -d $< > $@

cfg.main.dot: kod.ll
	opt-3.6 -dot-cfg $<

kod.ll: kod.c
	clang-3.6 -O3  -fno-unroll-loops -fno-reroll-loops -fno-vectorize -S -emit-llvm $<

clean:
	rm -f $(PROGS) $(LISTINGS) $(OBJS)
