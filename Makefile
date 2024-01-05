BUILD_DIR := .build

SPHINX_BUILD = sphinx-build
DOXYGEN = doxygen

CSFML_DOC := $(BUILD_DIR)/csfml

.PHONY: html
html:
	$(SPHINX_BUILD) . -b html $(BUILD_DIR)/html

$(CSFML_DOC):
	$(DOXYGEN) Doxyfile.in

.PHONY: csfml-doc
csfml-doc: $(CSFML_DOC)
