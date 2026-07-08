#!/bin/sh
set -eu

run_example() {
    name="$1"
    shift
    echo "==> ${name}"
    go run "$@"
}

run_expected_failure() {
    name="$1"
    shift
    output_file="${GOTMPDIR}/$(printf '%s' "${name}" | tr ' ' '-').log"

    echo "==> ${name} (expected failure)"
    rm -f "${output_file}"

    if go run "$@" >"${output_file}" 2>&1; then
        cat "${output_file}"
        echo "Expected ${name} to fail" >&2
        exit 1
    fi

    cat "${output_file}"

    if ! grep -q "Fatal:" "${output_file}"; then
        echo "Expected fatal output from ${name}" >&2
        exit 1
    fi
}

go test ./add-a-test/greetings
run_example "getting-started" ./getting-started/hello
run_example "call-module-code" ./call-module-code
run_example "random-greeting" ./random-greeting/hello
run_example "greetings-multiple-people" ./greetings-multiple-people/hello
run_expected_failure "handle-errors" ./handle-errors/hello

