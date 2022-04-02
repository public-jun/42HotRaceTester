#!/bin/sh

cd "$(dirname $0)"

#-------------------------------------
# USER SETTING
#-------------------------------------
readonly HOTRACE_DIR="../Hotrace/"
readonly HOTRACE_EXE="hotrace"
#-------------------------------------

readonly SCRIPT_DIR="$(pwd)"

readonly RESULT_DIR="${SCRIPT_DIR}/res"

readonly ANSWER_DIR="${SCRIPT_DIR}/test/ans"
readonly CASES_DIR="${SCRIPT_DIR}/test/cases"

readonly COLOR_RESET="\033[0m"
readonly COLOR_GREEN="\033[32m"
readonly COLOR_RED="\033[31m"

result_all=0
result_ok=0
result_ko=0