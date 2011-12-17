main: main.pdf
	mv main.pdf praca_inzynierska.pdf

main.pdf:
	pdflatex main.tex
	pdflatex main.tex
	evince praca_inzynierska.pdf

clean:
	rm -f *.aux
	rm -f *.log
	rm -f *.lof
	rm -f *.out
	rm -f *.toc
