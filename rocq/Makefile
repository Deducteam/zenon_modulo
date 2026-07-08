.PREFIX:

.PHONY: default
default: vo

ROCQSRC := zenon.v zenon_coqbool.v zenon_equiv.v zenon_induct.v zenon_focal.v zenon_arith.v zenon_arith_reals.v

ROCQOBJ := $(ROCQSRC:%.v=%.vo)

.PHONY: vo
vo: vo.mk
	$(MAKE) -f vo.mk

vo.mk: _CoqProject
	rocq makefile -f _CoqProject -o $@

_CoqProject: $(ROCQSRC)
	echo "-R . Zenon $(ROCQSRC)" > $@

.PHONY: clean-vo
clean-vo:
	$(MAKE) -f vo.mk clean

.PHONY: clean
clean: clean-vo
	-rm -f _CoqProject vo.mk vo.mk.conf .vo.mk.d
