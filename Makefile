BUILD_DIR := .build

SPHINX_BUILD = sphinx-build
DOXYGEN = doxygen

CSFML_DOC := $(BUILD_DIR)/csfml

.PHONY: all
all: $(CSFML_DOC)
	$(MAKE) -C api
	$(MAKE) html

.PHONY: html

html: $(BUILD_DIR)
	@ mkdir -p $(dir $@)
	$(SPHINX_BUILD) . -b html $(BUILD_DIR)/html -j $(shell nproc)

$(CSFML_DOC):
	@ mkdir -p $(dir $@)
	$(DOXYGEN) Doxyfile

.PHONY: csfml-doc
csfml-doc: $(CSFML_DOC)

.PHONY: clean
clean:
	$(RM) -rf $(BUILD_DIR)
	$(MAKE) -C api clean

.PHONY: re
re: clean
	$(MAKE) all
