ERRATA=errata
SOLUTION=selected_solutions
LATEXMK=latexmk -pdf -pdflatex="xelatex -synctex=1 -shell-escape -interaction=nonstopmode %O %S"

default:
	$(LATEXMK) $(ERRATA)
	$(LATEXMK) $(SOLUTION)

err:
	$(LATEXMK) $(ERRATA)

sol:
	$(LATEXMK) $(SOLUTION)

clean:
	rm -rf *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot *.auxlock
