BUILD = build
BOOKNAME = the-software-architecture-chronicles
TITLE = title.txt
METADATA = metadata.xml
STYLE = base.css
CHAPTERS = content/ch01.md content/ch02.md content/ch03.md content/ch04.md content/ch05.md content/ch06.md content/ch07.md content/ch7-4.md content/ch7-7.md content/ch7-8.md content/ch08.md content/ch09.md content/ch10.md content/ch11.md content/ch12.md content/ch13.md content/ch14.md content/ch15.md content/ch16.md content/ch17.md content/ch18.md content/ch19.md content/ch20.md
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
