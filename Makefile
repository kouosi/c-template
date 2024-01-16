BUILD_DIR := build
SRC_DIR := src
INC_DIR := include

CC_FLAG := -Wall -Wextra -Wpedantic -Wformat=2 -Wnested-externs -Wshadow \
           -Wno-unused-parameter -Wwrite-strings -Wstrict-prototypes \
           -Wold-style-definition -Wredundant-decls  -Wmissing-include-dirs
CC_FLAG	+= -std=c99 -O2 -I$(INC_DIR) -MMD

SRC_FILES := $(shell find -L $(SRC_DIR) -type f -name '*.c')
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.c.o,$(SRC_FILES))
DEP_FILES := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.c.d,$(SRC_FILES))

-include $(DEP_FILES)

all: build

build: $(OBJ_FILES)
	$(CC) -o $(BUILD_DIR)/app $(OBJ_FILES)

build_dir:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(dir $(OBJ_FILES))

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

$(BUILD_DIR)/%.c.o: $(SRC_DIR)/%.c | build_dir
	$(CC) $(CC_FLAG) -c -o $@ $<

