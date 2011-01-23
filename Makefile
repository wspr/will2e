
PKG = $(shell basename `pwd`)
FILES = README $(PKG).ins $(PKG).dtx
RESULTS = $(PKG).pdf $(PKG).sty

$(PKG).tar.gz: $(FILES) $(RESULTS)
	ctanify $(PKG).ins $(PKG).pdf README;
	rm README

README $(PKG).pdf: $(PKG).dtx
	pdflatex $<;
	makeindex -s gind.ist $(PKG);
	pdflatex $<;
	pdflatex $<;

$(PKG).sty: $(FILES)
	tex $(PKG).ins
	cp README.txt README

clean:
	git clean -dfx
