CSFML_INCLUDE := ../csfml/include/SFML

MODULES += Audio
MODULES += Graphics
MODULES += Network
MODULES += System
MODULES += Window

CSFML_HEADERS := $(foreach mod, $(MODULES), \
	$(foreach f, \
		$(shell find $(CSFML_INCLUDE)/$(mod) -type f -name "*.h"), \
		$(mod)/$(notdir $f)))

INDEXES := $(foreach mod, $(MODULES), $(mod)/index.md)

VPATH := $(CSFML_INCLUDE)
vpath %.h $(VPATH)

API_REF := $(CSFML_HEADERS:.h=.md)

all: $(API_REF)
$(API_REF): $(CSFML_HEADERS) $(INDEXES)

$(INDEXES):
	@ mkdir -p $(dir $@)
	@ touch $@
	@ echo -e "# $(dir $@)" | tee $@
	@ echo -e "\`\`\`{toctree}" | tee -a $@
	@ echo -e ":glob:\n\n*" | tee -a $@
	@ echo -e "\`\`\`" | tee -a $@

%.md: %.h
	@ mkdir -p $(dir $@)
	@ touch $@
	@ echo -e "# $(subst .md,,$(notdir $@))" | tee $@
	@ echo -e "\`\`\`{doxygenfile} $(subst ../,,$<)" | tee -a $@
	@ echo -e ":project: CSFML" | tee -a $@
	@ echo -e "\`\`\`" | tee -a $@

.PHONY: clean
clean:
	$(RM) $(API_REF)
	$(RM) -rf $(MODULES)

.PHONY: re
re: clean all
