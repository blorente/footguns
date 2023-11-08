#!/bin/bash
set -x
root=$(git rev-parse --show-toplevel)

cd "${root}" || exit 1
rm -rf docs
hugo --verbose --gc --minify --destination docs --baseURL 

