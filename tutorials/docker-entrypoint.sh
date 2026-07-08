#!/bin/sh
set -eu

workspace_dir="${WORKSPACE_DIR:-/workspace}"
local_go_root="${workspace_dir}/.local-go"

export GOCACHE="${local_go_root}/cache"
export GOTMPDIR="${local_go_root}/tmp"
export GOBIN="${local_go_root}/bin"
export GOMODCACHE="${local_go_root}/pkg/mod"

mkdir -p "${local_go_root}" "${GOCACHE}" "${GOTMPDIR}" "${GOBIN}" "${GOMODCACHE}"
cd "${workspace_dir}"

if [ "$#" -eq 0 ]; then
    echo "Usage: docker run --rm IMAGE <go arguments|verify>" >&2
    exit 1
fi

if [ "$1" = "verify" ]; then
    shift
    exec "${workspace_dir}/verify.sh" "$@"
fi

if [ "$1" = "go" ]; then
    shift
fi

exec go "$@"

