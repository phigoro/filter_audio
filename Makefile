PREFIX ?= /usr/local
LDLIBS = -lm -lpthread

TARGET = libfilteraudio.so

SRC = $(wildcard */*.c) filter_audio.c
OBJ = $(SRC:.c=.o)
HEADER = filter_audio.h

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(LDFLAGS) $(LDLIBS) -shared -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -fPIC -c -o $@ $<

install: all $(HEADER)
	mkdir -p $(DESTDIR)/$(PREFIX)/lib
	mkdir -p $(DESTDIR)/$(PREFIX)/include
	install -m755 $(TARGET) $(DESTDIR)/$(PREFIX)/lib/$(TARGET)
	install -m644 $(HEADER) $(DESTDIR)/$(PREFIX)/include/$(HEADER)

clean:
	rm -f $(TARGET) $(OBJ)

.PHONY: all clean install
