#! /usr/bin/env bash

# exit when any command fails
set -e

echo "C4 website: Update Software Repository page ..."

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

## Setup shell, including Lmod
#shellcheck disable=SC1091
[[ -f /etc/bashrc ]] && . /etc/bashrc

## Assert module is defined
type module

## Required software
SOFTWARE_HOME=/software/c4/cbi/software
PATH=${SOFTWARE_HOME}/R-4.2.1-gcc10/bin:$PATH

## Required R packages
## FIXME: Freeze an R package library with the required packages
export R_LIBS_USER=$(Rscript --vanilla -e "cat(Sys.getenv('R_LIBS_USER'))")

## Session info
Rscript --version
Rscript -e ".libPaths()"

cd "$SCRIPT_PATH/../docs/software"
git pull -X theirs
make clean
make build
make deploy

echo "C4 website: Update Software Repository page ... done"
