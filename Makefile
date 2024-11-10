# Variables
CC = i686-elf-gcc
CFLAGS = -std=gnu99 -ffreestanding -O2 -Wall -Wextra
TARGET = kernel.o
SRC = kernel.c
LDFLAGS = -nostdlib

# Build rule
$(TARGET): $(SRC)
	$(CC) -c $(SRC) -o $(TARGET) $(CFLAGS) $(LDFLAGS)

# Clean rule
clean:
	rm -f $(TARGET)

