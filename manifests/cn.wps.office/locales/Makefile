DICTS_URL ?= http://download.services.openoffice.org/files/contrib/dictionaries

.PHONY: all clean dicts

data/%.url:
	mkdir -p $(@D)
	echo $(DICTS_URL)/$*.zip > $@

data/%.zip: data/%.url
	wget $(shell cat $<) -O $@

data/%.size: data/%.zip
	stat --format='%s' $< > $@

data/%.sha256: data/%.zip
	sha256sum $< | awk '{ print $$1 }' > $@

all: dicts

dicts:
	tail -n +2 locales.csv | while IFS=, read -r lang dict_name dict_summary dict_license; do \
		$(MAKE) cn.wps.office.spellcheck.$$lang.yml && \
		$(MAKE) cn.wps.office.spellcheck.$$lang.metainfo.xml \
			DICT_NAME="$$dict_name" \
			DICT_SUMMARY="$$dict_summary" \
			DICT_LICENSE="$$dict_license"; \
	done

cn.wps.office.spellcheck.%.metainfo.xml:
	sed \
		-e "s/@LANG@/$*/g" \
		-e "s/@DICT_NAME@/$(DICT_NAME)/g" \
		-e "s/@DICT_SUMMARY@/$(DICT_SUMMARY)/g" \
		-e "s/@DICT_LICENSE@/$(DICT_LICENSE)/g" \
		cn.wps.office.spellcheck.@LANG@.metainfo.xml.in > $@

cn.wps.office.spellcheck.%.yml: data/%.url data/%.size data/%.sha256
	sed \
		-e "s/@LANG@/$*/g" \
		-e "s|@DICT_URL@|$(shell cat data/$*.url)|g" \
		-e "s/@DICT_SHA256@/$(shell cat data/$*.sha256)/g" \
		-e "s/@DICT_SIZE@/$(shell cat data/$*.size)/g" \
		cn.wps.office.spellcheck.@LANG@.yml.in > $@

clean-manifests:
	rm -f cn.wps.office.spellcheck.*.yml

clean-metainfo:
	rm -f cn.wps.office.spellcheck.*.metainfo.xml

clean: clean-manifests clean-metainfo
