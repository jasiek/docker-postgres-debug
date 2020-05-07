VERSIONS=$(shell ls -d -- */ | sed "s/\///g" )
all: $(VERSIONS)
.PHONY: force
$(VERSIONS): force
	docker build -t postgres-debug:$@ $@

