###############################################################################
## Makefile for English--Catalan
###############################################################################

LANG1=eng
LANG2=cat

VAR1=#leave empty
VAR2=_valencia_gva
VAR3=_valencia_uni

VAR11=#leave empty
VAR12=_US

LANG1GB=$(LANG1)$(VAR11)
LANG1US=$(LANG1)$(VAR12)

LANG2C=$(LANG2)$(VAR1)
LANG2V=$(LANG2)$(VAR2)
LANG2U=$(LANG2)$(VAR3)

PREFIX1=$(LANG1)-$(LANG2)
PREFIX1C=$(LANG1)-$(LANG2C)
PREFIX1V=$(LANG1)-$(LANG2V)
PREFIX1U=$(LANG1)-$(LANG2U)

PREFIX2=$(LANG2)-$(LANG1)
PREFIX2GB=$(LANG2)-$(LANG1GB)
PREFIX2US=$(LANG2)-$(LANG1US)

BASENAME=apertium-$(PREFIX1)

TARGETS_PREFS = prefs/$(PREFIX1).xml

TARGETS_COMMON =		\
	$(PREFIX1).automorf.bin	\
	$(PREFIX1).prob		\
	$(PREFIX1).rlx.bin	\
	$(PREFIX1C).autobil.bin	 \
	$(PREFIX1V).autobil.bin	 \
	$(PREFIX1U).autobil.bin	 \
	$(PREFIX1).autolex.bin	\
	$(PREFIX1).autogen.bin	 \
	$(PREFIX1C).autopgen.bin	\
	$(PREFIX1V).autopgen.bin	\
	$(PREFIX1U).autopgen.bin	\
	$(PREFIX1C).prefs.rlx.bin	\
	$(PREFIX1V).prefs.rlx.bin	\
	$(PREFIX1U).prefs.rlx.bin	\
	$(PREFIX1).pre2017_prefs.rlx.bin \
	$(PREFIX1).t1x.bin	\
	$(PREFIX1).t2x.bin	\
	$(PREFIX1).t3x.bin	\
	$(PREFIX1).t4x.bin	\
	$(PREFIX1).autoseq.bin	\
	$(PREFIX1).revautoseq.bin	\
	$(PREFIX2).automorf.bin	\
	$(PREFIX2).prob		\
	$(PREFIX2).rlx.bin	\
	$(PREFIX2GB).autobil.bin	\
	$(PREFIX2US).autobil.bin	\
	$(PREFIX2).autolex.bin	\
	$(PREFIX2GB).autogen.bin	\
	$(PREFIX2US).autogen.bin	\
	$(PREFIX2GB).autopgen.bin	\
	$(PREFIX2US).autopgen.bin	\
	$(PREFIX2).t1x.bin	\
	$(PREFIX2).t2x.bin	\
	$(PREFIX2).t3x.bin	\
	$(PREFIX2).autoseq.bin	\
	$(PREFIX2).revautoseq.bin	\
	prefs/$(PREFIX1).xml


# This include defines goals for install-modes, .deps/.d, autobil.prefixes and .mode files:
@ap_include@

###############################################################################
## Monolingual transducers
###############################################################################

# -------------------
# English analysis:
# -------------------

$(PREFIX1C).automorf.bin: $(AP_SRC1)/$(LANG1).automorf.bin $(PREFIX1C).autobil.bin
	lt-trim $^ $@

$(PREFIX1V).automorf.bin: $(AP_SRC1)/$(LANG1).automorf.bin $(PREFIX1V).autobil.bin
	lt-trim $^ $@

$(PREFIX1U).automorf.bin: $(AP_SRC1)/$(LANG1).automorf.bin $(PREFIX1V).autobil.bin
	lt-trim $^ $@

# -------------------
# English generation:
# ---------------------

$(PREFIX2GB).autogen.bin: $(AP_SRC1)/$(LANG1GB).autogen.bin
	cp $< $@

$(PREFIX2US).autogen.bin: $(AP_SRC1)/$(LANG1US).autogen.bin
	cp $< $@

# -------------------
# Catalan analysis:
# -------------------

$(PREFIX2GB).automorf.bin: $(AP_SRC2)/$(LANG2).automorf.bin $(PREFIX2GB).autobil.bin
	lt-trim $^ $@

$(PREFIX2US).automorf.bin: $(AP_SRC2)/$(LANG2).automorf.bin $(PREFIX2US).autobil.bin
	lt-trim $^ $@

# -------------------
# Catalan generation:
# ---------------------

$(PREFIX1).autogen.bin: $(AP_SRC2)/$(LANG2).autogen.bin
	cp $< $@



###############################################################################
## Tagger models
###############################################################################

$(PREFIX1).prob: $(AP_SRC1)/$(LANG1).prob
	cp $< $@

$(PREFIX2).prob: $(AP_SRC2)/$(LANG2).prob
	cp $< $@

###############################################################################
## Disambiguation rules
###############################################################################

$(PREFIX1).rlx.bin: $(AP_SRC1)/$(LANG1).rlx.bin
	cp $< $@

$(PREFIX2).rlx.bin: $(AP_SRC2)/$(LANG2).rlx.bin
	cp $< $@

###############################################################################
## Bilingual dictionaries
###############################################################################

.deps/$(PREFIX1).dix: $(BASENAME).$(PREFIX1).dix .deps/.d
	cp $< $@

.deps/$(PREFIX1).cat.dix: .deps/$(PREFIX1).dix
	apertium-genvrdix cat $< >$@

.deps/$(PREFIX1).val_gva.dix: .deps/$(PREFIX1).dix
	apertium-genvrdix val_gva $< >$@

.deps/$(PREFIX1).val_uni.dix: .deps/$(PREFIX1).dix
	apertium-genvrdix val_uni $< >$@

$(PREFIX1C).autobil.bin: .deps/$(PREFIX1).cat.dix
	apertium-validate-dictionary $<
	lt-comp -r cat lr $< $@

$(PREFIX1V).autobil.bin: .deps/$(PREFIX1).val_gva.dix
	apertium-validate-dictionary $<
	lt-comp -r val_gva lr $< $@

$(PREFIX1U).autobil.bin: .deps/$(PREFIX1).val_uni.dix
	apertium-validate-dictionary $<
	lt-comp -r val_uni lr $< $@

.deps/$(PREFIX1).eng.dix: .deps/$(PREFIX1).dix
	apertium-genvrdix eng $< >$@

.deps/$(PREFIX1).eng_US.dix: .deps/$(PREFIX1).dix
	apertium-genvrdix eng_US $< >$@

$(PREFIX2GB).autobil.bin: .deps/$(PREFIX1).eng.dix
	apertium-validate-dictionary $<
	lt-comp -l eng rl $< $@

$(PREFIX2US).autobil.bin: .deps/$(PREFIX1).eng_US.dix
	apertium-validate-dictionary $<
	lt-comp -l eng_US rl $< $@


###############################################################################
## Lexical selection rules
###############################################################################

$(PREFIX1).autolex.bin: $(BASENAME).$(PREFIX1).lrx
	apertium-validate-lrx $<
	lrx-comp $< $@

$(PREFIX2).autolex.bin: $(BASENAME).$(PREFIX2).lrx
	apertium-validate-lrx $<
	lrx-comp $< $@

###############################################################################
## Reordering separable/discontiguous multiwords
###############################################################################

$(PREFIX1).autoseq.bin: $(BASENAME).$(PREFIX1).lsx
	lsx-comp lr $< $@

$(PREFIX2).autoseq.bin: $(BASENAME).$(PREFIX2).lsx
	lsx-comp lr $< $@

$(PREFIX1).revautoseq.bin: $(BASENAME).$(PREFIX2).lsx
	lsx-comp rl $< $@

$(PREFIX2).revautoseq.bin: $(BASENAME).$(PREFIX1).lsx
	lsx-comp rl $< $@

###############################################################################
## Structural transfer rules
###############################################################################

$(PREFIX1).t1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $<
	apertium-preprocess-transfer $< $@

$(PREFIX1).t2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $<
	apertium-preprocess-transfer $< $@

$(PREFIX1).t3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-interchunk $<
	apertium-preprocess-transfer $< $@

$(PREFIX1).t4x.bin: $(BASENAME).$(PREFIX1).t4x
	apertium-validate-postchunk $<
	apertium-preprocess-transfer $< $@


$(PREFIX2).t1x.bin: $(BASENAME).$(PREFIX2).t1x
	apertium-validate-transfer $<
	apertium-preprocess-transfer $< $@

$(PREFIX2).t2x.bin: $(BASENAME).$(PREFIX2).t2x
	apertium-validate-interchunk $<
	apertium-preprocess-transfer $< $@

$(PREFIX2).t3x.bin: $(BASENAME).$(PREFIX2).t3x
	apertium-validate-postchunk $<
	apertium-preprocess-transfer $< $@

###############################################################################
## Postgeneration dictionaries
###############################################################################

$(PREFIX1C).autopgen.bin: $(AP_SRC2)/$(LANG2C).autopgen.bin
	cp $< $@

$(PREFIX1V).autopgen.bin: $(AP_SRC2)/$(LANG2V).autopgen.bin
	cp $< $@

$(PREFIX1U).autopgen.bin: $(AP_SRC2)/$(LANG2U).autopgen.bin
	cp $< $@

$(PREFIX2GB).autopgen.bin: $(AP_SRC1)/$(LANG1GB).autopgen.bin
	cp $< $@

$(PREFIX2US).autopgen.bin: $(AP_SRC1)/$(LANG1US).autopgen.bin
	cp $< $@


###############################################################################
## Variant preferences
###############################################################################

$(PREFIX1).pre2017_prefs.rlx.bin: $(AP_SRC2)/$(LANG2).pre2017_prefs.rlx.bin
	cp $< $@

$(PREFIX1C).prefs.rlx.bin: $(AP_SRC2)/$(LANG2C).prefs.rlx.bin
	cp $< $@

$(PREFIX1V).prefs.rlx.bin: $(AP_SRC2)/$(LANG2V).prefs.rlx.bin
	cp $< $@

$(PREFIX1U).prefs.rlx.bin: $(AP_SRC2)/$(LANG2U).prefs.rlx.bin
	cp $< $@

###############################################################################
## Preferences
###############################################################################

prefs/$(LANG2).preferences.xml: $(AP_SRC2)/$(LANG2).preferences.xml
	$(MKDIR_P) prefs
	cp $< $@

define mergePrefs =
$(MKDIR_P) prefs
echo '<preferences>' >$@.tmp
for f in $^; do xmllint --xpath '/preferences/preference' "$$f"; done >>$@.tmp
echo '</preferences>' >>$@.tmp
mv $@.tmp $@
endef

# uncomment when we have bilingual preferences
# prefs/$(PREFIX1).xml: $(LANG2).preferences.xml $(PREFIX1).preferences.xml
prefs/$(PREFIX1).xml: prefs/$(LANG2).preferences.xml 
		$(mergePrefs)

###############################################################################
## Distribution
###############################################################################

EXTRA_DIST=					\
		$(BASENAME).$(PREFIX1).lrx	\
		$(BASENAME).$(PREFIX1).dix	\
		$(BASENAME).$(PREFIX2).lrx	\
		$(BASENAME).$(PREFIX1).t1x	\
		$(BASENAME).$(PREFIX1).t2x	\
		$(BASENAME).$(PREFIX1).t3x	\
		$(BASENAME).$(PREFIX1).t4x	\
		$(BASENAME).$(PREFIX2).t1x	\
		$(BASENAME).$(PREFIX2).t2x	\
		$(BASENAME).$(PREFIX2).t3x	\
		modes.xml	\
		$(PREFIX1).preferences.xml

###############################################################################
## Installation
###############################################################################

apertium_eng_catdir=$(prefix)/share/apertium/$(BASENAME)/

# Files which should be installed to $(prefix)/share/apertium/$(BASENAME)/:
apertium_eng_cat_DATA=	\
	$(TARGETS_COMMON)				\
	$(BASENAME).$(PREFIX1).arx          \
	$(BASENAME).$(PREFIX1).t1x			\
	$(BASENAME).$(PREFIX1).t2x			\
	$(BASENAME).$(PREFIX1).t3x			\
	$(BASENAME).$(PREFIX1).t4x			\
	$(BASENAME).$(PREFIX2).arx          \
	$(BASENAME).$(PREFIX2).t1x			\
	$(BASENAME).$(PREFIX2).t2x			\
	$(BASENAME).$(PREFIX2).t3x

# All modes are created by the same goal, listing several will just give problems with make -j2
noinst_DATA=modes/$(PREFIX1).mode $(TARGETS_PREFS)

install-data-local: install-modes
	$(MKDIR_P) $(DESTDIR)$(apertium_modesdir)/../prefs
	$(INSTALL_DATA) $(TARGETS_PREFS) $(DESTDIR)$(apertium_modesdir)/../prefs

###############################################################################
## Cleanup
###############################################################################

CLEANFILES = $(TARGETS_COMMON)
clean-local:
	-rm -rf .deps modes

###############################################################################
## Test
###############################################################################

test: all
	apertium-regtest test
