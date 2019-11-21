#!/usr/bin/env bash

useradd -m -G users,portage -s /bin/bash testrunner

su --preserve-environment testrunner -c \
    "kcov --bash-dont-parse-binary-dir \
     --include-path=usr \
     /var/tmp/coverage \
     bats -t tests"
