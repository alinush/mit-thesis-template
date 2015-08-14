all:
	texi2pdf main.tex

clean:
	rm -f *.aux *.blg *.lof *.lot *.log *.bbl *.blg *.toc
	rm -f *.pdf
