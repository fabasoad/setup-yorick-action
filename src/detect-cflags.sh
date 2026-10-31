#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

# yorick sources contain pre-C99 constructs (K&R function definitions, implicit
# int, etc.). gcc 14+ reports those as errors instead of warnings, and gcc 15
# (ubuntu-26.04) additionally compiles as C23 by default, so the build fails
# without the flags below. Every flag is probed first, because a compiler that
# does not know it would fail yorick's ./configure instead.
CANDIDATE_FLAGS="-std=gnu17
-fpermissive
-Wno-error=implicit-int
-Wno-error=implicit-function-declaration
-Wno-error=int-conversion
-Wno-error=incompatible-pointer-types
-Wno-error=return-mismatch
-Wno-error=declaration-missing-parameter-type"

# Checks whether the C compiler accepts a flag.
# Parameters:
# 1. (Required) Flag to probe.
supports_flag() {
  echo 'int main(void) { return 0; }' \
    | "${CC:-cc}" -Werror "${1}" -x c - -o /dev/null >/dev/null 2>&1
}

main() {
  if [ -n "${CFLAGS}" ]; then
    log_info "Keeping CFLAGS provided by the environment: ${CFLAGS}."
    echo "cflags=${CFLAGS}" >> "$GITHUB_OUTPUT"
    return 0
  fi

  cflags=""
  for flag in ${CANDIDATE_FLAGS}; do
    if supports_flag "${flag}"; then
      cflags="${cflags:+${cflags} }${flag}"
    fi
  done

  log_info "Detected CFLAGS: ${cflags:-<empty>}."
  echo "cflags=${cflags}" >> "$GITHUB_OUTPUT"
}

main "$@"
