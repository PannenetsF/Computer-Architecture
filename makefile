all:
	make slide
	make note
	make hw
	make clean

slide:
	cd slides/ \
	&& latexmk -xelatex slides.tex \
	&& cd ..

note:
	cd notes/ \
	&& latexmk -xelatex notes.tex \
	&& cd ..

# hw:=$(wildcard homework/homework*.tex)

hw: 
	cd homework\
	&& make \
	&& cd ..

clean:
	rm `find ./ -regex ".*\.log\|.*\.aux\|.*\.xdv\|.*\.in\|.*\.out\|.*\.lua\|.*\.fdb_latexmk\|.*\.fls\|.*\.toc\|.*\.gz"`





