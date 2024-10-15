CC = gcc
CFLAGS = -Iinclude
LDFLAGS = -L.
LIBS = -lm

all: libcalculator.a calculator

libcalculator.a: src/add.o
	ar rcs $@ $^

calculator: src/main.o libcalculator.a
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

src/add.o: src/add.c
	$(CC) $(CFLAGS) -c -o $@ $<

src/main.o: src/main.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f src/*.o libcalculator.a calculator

.PHONY: clean