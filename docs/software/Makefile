SHELL=bash
PAGE=software-repositories

all: $(PAGE).md

clean:
	rm -rf lmod_data
	mkdir lmod_data

lmod_data/%.json:
	@echo "target: $@"
	@echo "stem: $*"
	@mkdir -p "$(@D)"
	"$${LMOD_DIR}/spider" --no_recursion -o jsonSoftwarePage "$*" > "$@"

install_deps:
	Rscript -e 'if (!requireNamespace("R.rsp")) install.packages("R.rsp")'
	Rscript -e 'if (!requireNamespace("remotes")) install.packages("remotes")'
	Rscript -e 'if (!requireNamespace("lmodweb")) remotes::install_github("ucsf-wynton/lmodweb")'

spider: clean
	@module load CBI r && \
	export R_BIOCONDUCTORX_DISABLE=true; \
	paths=$$(Rscript -e 'source("lmodweb.config.R"); cat(vapply(module_repositories, FUN = function(x) x[["module_path"]], FUN.VALUE = NA_character_))'); \
	echo "Module paths: $${paths}"; \
	for path in $${paths}; do \
	    make "lmod_data/$${path}.json"; \
	done

build:
	touch $(PAGE).md.rsp
	make all
	git diff

$(PAGE).md: $(PAGE).md.rsp
	module load CBI r && \
	export R_BIOCONDUCTORX_DISABLE=true; \
	Rscript -e R.rsp::rfile $< --postprocess=FALSE

deploy: $(PAGE).md
	git commit $< -m "SOFTWARE: Rebuilt set of available modules" &> /dev/null; true
	git pull
	git push &> /dev/null; true


