CC=gcc
LD=ld

BIN=bin
ODIR=obj
SRC=src
LDS=lds

.DEFAULT_GOAL := all

$(shell mkdir -p $(BIN) $(ODIR))

$(ODIR)/SimpleSection.o: $(SRC)/SimpleSection.c
	$(CC) -c $^ -o $@

$(ODIR)/TinyHelloWorld.o: $(SRC)/TinyHelloWorld.c
	$(CC) -c $^ -o $@ -fno-builtin

SimpleSection: $(ODIR)/SimpleSection.o
	$(CC) -o $(BIN)/$@ $^

TinyHelloWorld: $(ODIR)/TinyHelloWorld.o
	$(LD) -static -e nomain -o $(BIN)/$@ $^

TinyHelloWorld-manual: $(ODIR)/TinyHelloWorld.o
	$(LD) -static -T $(LDS)/TinyHelloWorld.lds -o $(BIN)/$@ $^

.PHONY: all clean
all: SimpleSection TinyHelloWorld

clean:
	rm -r $(ODIR)/ $(BIN)/
