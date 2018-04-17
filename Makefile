LAMOS_TO_JSON=node_modules/.bin/lamos-to-json

all: site/index.html

site/index.html: gdpr.json to-html | site
	./to-html $< > $@

site:
	mkdir -p site

.INTERMEDIATE: gdpr.raw.json gdpr.json

gdpr.raw.json: gdpr.lamos | $(LAMOS_TO_JSON)
	$(LAMOS_TO_JSON) < $< > $@

gdpr.json: gdpr.raw.json add-numbers
	./add-numbers > $@

$(LAMOS_TO_JSON):
	npm i

.PHONY: clean

clean:
	rm -f site/index.html
