.PREFIX:

.PHONY: default
default: dko

DKSRC := cc.dk dk_bool.dk dk_logic.dk dk_tuple.dk basics_minimal.dk zen.dk zenon_focal.dk zenon.dk

DKOBJ := $(DKSRC:%.dk=%.dko)

.PHONY: dko
dko: $(DKOBJ)

%.dko: %.dk
	dk check -e $*.dk

include dko.mk

dko.mk:
	dk dep $(DKSRC) > $@

.PHONY: clean-dko
clean-dko:
	-rm -f $(DKOBJ)

.PHONY: clean
clean: clean-dko
	-rm -f dko.mk
