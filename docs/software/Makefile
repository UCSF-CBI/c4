PAGE=software-repositories

all: $(PAGE).md

build:
	touch $(PAGE).md.rsp
	make all
	git diff

$(PAGE).md: $(PAGE).md.rsp
	module load CBI r/3.6.3 && \
	export R_BIOCONDUCTORX_DISABLE=true; \
	Rscript -e R.rsp::rfile $< --postprocess=FALSE

deploy: $(PAGE).md
	git commit $< -m "SOFTWARE: Rebuilt set of available modules" &> /dev/null; true
	git pull
	git push &> /dev/null; true


