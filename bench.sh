#!/bin/sh

#-------------------------------------
# USER SETTING
#-------------------------------------
# readonly HOTRACE_DIR="./"
# readonly HOTRACE_EXE="hotrace"
#-------------------------------------

source help/helper.sh
readonly HOTRACE_PATH="${HOTRACE_DIR}${HOTRACE_EXE}"


bench () {
	num=$(($1))
	if [[ $1 == "bash" ]]; then
		time "${HOTRACE_PATH}" < <(python3 gen.py 1) > /dev/null 2>&1
	else
		(time "${HOTRACE_PATH}" < <(python3 gen.py 10) > /dev/null) 2>&1 | awk -F 'cpu ' '$0=$2_'
	fi
}

main () {
	shell=bash
	p=`ps -p $$ -o command | tail -1`
	if echo "$p" | grep '^bash ' > /dev/null  ; then
		shell=bash
	elif echo "$p" | grep '^zsh ' > /dev/null ; then
		shell=zsh
	elif echo "$p" | grep '^sh ' > /dev/null; then
		shell=sh
	fi
	printf "${COLOR_GREEN}BENCH START${COLOR_RESET}\n"
	bench $1 "${shell}"
	printf "${COLOR_GREEN}BENCH DONE${COLOR_RESET}"
}

main $@