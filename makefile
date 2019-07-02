RSCRIPT = Rscript

# if you wildcard the all-target, then nothing will happen if the target doesn't
# exist (no target). hard code the target.
WRITEUP = CHANGE-THIS.pdf

TEX_FILES = $(wildcard tex-input/*.tex) \
	$(wildcard tex-input/*/*.tex) \
	$(wildcard tex-input/*/*/*.tex)

all : $(WRITEUP)

# knitr is becoming more picky about encoding, make it output utf-8
$(WRITEUP) : $(wildcard *.rmd) $(TEX_FILES)
	$(RSCRIPT) -e "rmarkdown::render(input = Sys.glob('*.rmd'), encoding = 'UTF-8')"