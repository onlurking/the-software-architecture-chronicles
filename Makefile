BUILD = build
BOOKNAME = the-software-architecture-chronicles
TITLE = title.txt
METADATA = metadata.xml
STYLE = base.css
CHAPTERS = $(sort $(wildcard content/*))
COVER_IMAGE = images/cover.jpg
TOC = --toc --toc-depth=2

all: book

book: epub

clean:
	rm -r $(BUILD)

epub: $(BUILD)/epub/$(BOOKNAME).epub

$(BUILD)/epub/$(BOOKNAME).epub: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
	pandoc $(TOC) -f markdown+smart --epub-metadata=$(METADATA) --css=$(STYLE) --highlight-style pygments --epub-cover-image=$(COVER_IMAGE) --lua-filter=links-to-html.lua -o $@ $^

.PHONY: all book clean epub
