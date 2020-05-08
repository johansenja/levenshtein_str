CRYSTAL = crystal
TARGET = ../../lib/levenshtein_str.bundle

install: all

all: shards $(TARGET)

shards:
	shards

$(TARGET): ./src/levenshtein_str.cr
	$(CRYSTAL) $< --link-flags "-dynamic -bundle -Wl,-undefined,dynamic_lookup" -o $(TARGET)

clean:
	rm -f ../../**/*.bundle*
