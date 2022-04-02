#!/bin/sh

source ./helper.sh

readonly HOTRACE_PATH="${HOTRACE_DIR}${HOTRACE_EXE}"

clean () {
	rm -rf "${RESULT_DIR}"
}



is_ok () {
	if [[ -z "${diff}" ]]; then
		return 0
	fi
	return 1
}

print_ok () {
	printf "${COLOR_GREEN}[✔ ]${COLOR_RESET}"
}

print_ko () {
	printf "${COLOR_RED}[✗ ]${COLOR_RESET}"
}


check_diff () {
	file=$1
	diff=$(diff ${RESULT_DIR}/${file%%.*}.res ${ANSWER_DIR}/${file%%.*}.ans)
	if is_ok ; then
		print_ok
		let result_ok++
	else
		print_ko
		let result_ko++
	fi
	let result_all++
}

run_test () {
	file=$1
	if "${is_valgrind}"; then
		valgrind "${HOTRACE_PATH}" < "${CASES_DIR}/${file}" > "${RESULT_DIR}/${file%%.*}.res"
	else
		"${HOTRACE_PATH}" < "${CASES_DIR}/${file}" > "${RESULT_DIR}/${file%%.*}.res"
	fi
	check_diff ${file}
}

run_all_tests() {
	for file in $(ls ${CASES_DIR}); do
		run_test "${file}"
		echo "${file%%.*} TEST!!"
	done
}

print_result () {
	echo -e "\nRESULT"
	if [[ ${result_ok} -eq ${result_all} ]]; then
		printf "\t${COLOR_GREEN}${result_ok} / ${result_all}${COLOR_RESET}\t\n"
	else
		printf "\t${COLOR_RED}${result_ok} / ${result_all}${COLOR_RESET}\t\n"
	fi
}

usage () {
	cat << EOM
Usage: bash grademe.sh [clean] or [OPTION]...
 -h          Display help
 -l          Check leak for valgrind
 clean       Remove result dir
EOM
	exit 2
}

set_option () {
	if [[ $1 == clean ]]; then
		clean
		exit
	fi

	is_valgrind=false
	while getopts "lh" optKey; do
		case "$optKey" in
		l) is_valgrind=true ;;
		'-h'|'--help'|* ) usage;;
		esac
	done
}


main () {
	set_option $@
	echo -e "HotRaceTester!\n"
	clean
	mkdir ${RESULT_DIR}
	run_all_tests
	print_result
}

main $@