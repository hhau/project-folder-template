RSCRIPT = Rscript
PLOT_SETTINGS = scripts/common/plot-settings.R
TEX_FILES = $(wildcard tex-input/*.tex) \
	$(wildcard tex-input/*/*.tex) \
	$(wildcard tex-input/*/*/*.tex)

# if you wildcard the all-target, then nothing will happen if the target doesn't
# exist (no target). hard code the target.
# CHANGE THIS:
WRITEUP = report-template.pdf

all : $(WRITEUP)

# knitr is becoming more picky about encoding, specify UTF-8 input
$(WRITEUP) : $(wildcard *.rmd) $(TEX_FILES)
	$(RSCRIPT) -e "rmarkdown::render(input = Sys.glob('*.rmd'), encoding = 'UTF-8')"