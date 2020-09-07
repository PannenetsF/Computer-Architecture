all:
	make slide
	make note
	make clean

slide:
	cd slides/ \
	&& latexmk -xelatex slides.tex \
	&& cd ..

note:
	cd notes/ \
	&& latexmk -xelatex notes.tex \
	&& cd ..

clean:
	rm `find ./ -regex ".*\.log\|.*\.aux\|.*\.xdv\|.*\.in\|.*\.out\|.*\.lua\|.*\.fdb_latexmk\|.*\.fls\|.*\.toc"`





