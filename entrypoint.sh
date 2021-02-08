#!/bin/sh
set -eou pipefail

# Debug: just testing output while building
echo "### DEBUG ###"

pwd # /github/workspace, GITHUB_WORKSPACE dir if actions/checkout used

ls # project root's files

echo "### END DEBUG ###"


# run the user supplied function
execute_user_command() {
  set -x
  "$@"
  set +x
}

execute_user_command "$1";

# we should take care of the saving after this
