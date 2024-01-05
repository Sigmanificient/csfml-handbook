BUILD_DIR := .build
SPHINXBUILD := sphinx-build

.PHONY: html

html:
	$(SPHINXBUILD) . -b html $(BUILD_DIR)/html
