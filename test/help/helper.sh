#!/bin/sh

cd "$(dirname $0)"

readonly SCRIPT_DIR="$(pwd)"
readonly TMP_DIR="${SCRIPT_DIR}/output"

readonly CASES_DIR="${SCRIPT_DIR}/cases"


result_all=0
result_ok=0
result_ko=0