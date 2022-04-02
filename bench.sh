#!/bin/sh


source help/helper.sh

readonly HOTRACE_PATH="${HOTRACE_DIR}${HOTRACE_EXE}"

bench () {
	num=$(($1))
	if [[ $2 != "zsh" ]]; then
		time "${HOTRACE_PATH}" < <(python3 gen.py $num) > /dev/null 2>&1
	else
		(time "../${HOTRACE_PATH}" < <(python3 ../gen.py ${num}) > /dev/null) 2>&1 | awk -F 'cpu ' '$0=$2_'
	fi
}

check_shell () {
	shell=bash
	p=`ps -p $$ -o command | tail -1`
	if echo "$p" | grep '^bash ' > /dev/null  ; then
		shell=bash
	elif echo "$p" | grep '^zsh ' > /dev/null ; then
		shell=zsh
	elif echo "$p" | grep '^sh ' > /dev/null; then
		shell=sh
	fi
}

main () {
	if [ $# = 0 ]; then
		echo "Input bench size"
		exit 1
	fi
	check_shell
	printf "${COLOR_GREEN}BENCH START${COLOR_RESET}\n"
	bench $1 "${shell}"
	printf "${COLOR_GREEN}BENCH DONE${COLOR_RESET}"
}

main $@