BUILD_DIR := .build

SPHINX_BUILD = sphinx-build
DOXYGEN = doxygen

CSFML_DOC := $(BUILD_DIR)/csfml
CSFML3_DOC := $(BUILD_DIR)/csfml-3

.PHONY: all
all: api/.done api-v3/.done
	@ mkdir -p $(dir $@)
	$(SPHINX_BUILD) . -b html $(BUILD_DIR)/html

api/.done: $(CSFML_DOC)
	$(MAKE) -C api

api-v3/.done: $(CSFML3_DOC)
	$(MAKE) -C api-v3

$(CSFML_DOC):
	@ mkdir -p $@
	$(DOXYGEN) api/Doxyfile

$(CSFML3_DOC):
	@ mkdir -p $@
	$(DOXYGEN) api-v3/Doxyfile

.PHONY: clean
clean:
	$(RM) -rf $(BUILD_DIR)
	$(MAKE) -C api clean
	$(MAKE) -C api-v3 clean

.PHONY: re
re: clean
	$(MAKE) all
