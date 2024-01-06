CSFML_INCLUDE := ../csfml/include

CSFML_HEADERS := $(sort \
	$(foreach f, \
		$(shell find $(CSFML_INCLUDE) -type f -name "*.h"), \
		$(notdir $f)))

VPATH := $(sort \
	$(foreach f, \
		$(shell find $(CSFML_INCLUDE) -type f -name "*.h"), \
		$(dir $f)))

vpath %.h $(VPATH)
API_REF := $(CSFML_HEADERS:.h=.md)

all: $(API_REF)
$(API_REF): $(CSFML_HEADERS)

%.md: %.h
	@ touch $@
	@ echo -e "# $(subst .md,,$@)\n" | tee $@
	@ echo -e "\`\`\`{doxygenfile} $(subst ../,,$<)" | tee -a $@
	@ echo -e ":project: CSFML" | tee -a $@
	@ echo -e "\`\`\`" | tee -a $@

.PHONY: clean
clean:
	$(RM) $(API_REF)

.PHONY: re
re: clean all
