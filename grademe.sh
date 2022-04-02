#!/bin/sh

source help/helper.sh

readonly HOTRACE_PATH="${HOTRACE_DIR}${HOTRACE_EXE}"

clean () {
	rm -rf "${RESULT_DIR}"
}

if [[ $1 == clean ]]; then
	clean
	exit
fi

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
	printf "${COLOR_RED}[✔ ]${COLOR_RESET}"
}


check_diff () {
	diff=$(diff ${RESULT_DIR}/$1.res ${ANSWER_DIR}/$1.ans)
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
	"${HOTRACE_PATH}" < "${CASES_DIR}/${file}.htr" > "${RESULT_DIR}/${file}.res"
	check_diff ${file}
}

run_all_tests() {
	for file in $(ls ${CASES_DIR} | sed 's/\.htr//'); do
		run_test "${file}"
		echo "${file} TEST!!"
	done
}

print_result () {
	echo -e "\n\n\nRESULT"
	if [[ ${result_ok} -eq ${result_all} ]]; then
		printf "\t${COLOR_GREEN}${result_ok} / ${result_all}${COLOR_RESET}\t\n"
	else
		printf "\t${COLOR_RED}${result_ok} / ${result_all}${COLOR_RESET}\t\n"
	fi
}

main () {
	echo HotRaceTester!
	clean
	mkdir ${RESULT_DIR}
	run_all_tests
	print_result
}

main $@