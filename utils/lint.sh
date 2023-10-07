#!/bin/bash

run_lint() {
    shellcheck ./"$1"
}

run_lint utils/format.sh
run_lint utils/lint.sh
run_lint utils/clean.sh
run_lint utils/create-patch.sh
