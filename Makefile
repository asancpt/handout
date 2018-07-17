all: gitbook pdf
gitbook:
	Rscript --quiet _render.R "bookdown::gitbook"
pdf:
	Rscript --quiet _render.R "bookdown::pdf_book"

pdf2:
	Rscript -e  "rmarkdown::render('index.Rmd', output_format = 'bookdown::pdf_document2')"

render-all:
	Rscript --quiet _render.R

clean:
	Rscript -e "options(bookdown.clean_book = TRUE);bookdown::clean_book()"

publish:
	Rscript --quiet _render.R "bookdown::gitbook" ; lazygit 'publish: gitbook'

rmd:
	Rscript -e "rmarkdown::render('keynote.Rmd', output_format = 'html_document', encoding = 'UTF-8')"

book:
	Rscript -e "bookdown::render_book('index.Rmd', encoding = 'UTF-8')"

