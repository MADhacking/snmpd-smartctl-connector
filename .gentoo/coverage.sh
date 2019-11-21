#!/usr/bin/env bash

kcov --bash-dont-parse-binary-dir \
     --include-path=usr \
     /var/tmp/coverage \
     bats -t tests
