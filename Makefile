TEXNAME=main
PDFNAME=main

all: clean latexmk

latexmk: latexmk_clean
	# For some reason using -auxdir=build/ will result in failed builds
	latexmk -pdf ${TEXNAME}

texi2pdf: texi2pdf_clean
	texi2pdf --build-dir=build/ ${TEXNAME}.tex -o ${PDFNAME}.pdf

clean: texi2pdf_clean latexmk_clean
	rm -f *.pdf

latexmk_clean:
	rm -f *.fls *.fdb_latexmk *.dvi

texi2pdf_clean:
	rm -rf build/
	rm -f *.aux *.blg *.lof *.lot *.log *.bbl *.blg *.toc

