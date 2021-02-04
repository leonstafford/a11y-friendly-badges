#!/bin/sh
set -eou pipefail

git fetch --tags

latestVersionTag=$(git describe --tags "$(git rev-list --tags --max-count=1)");

# Debug: just testing output while building
echo "$latestVersionTag"

# run the user supplied function
function execute_user_command() {
  set -x
  "$@"
  set +x
}

execute_user_command( $1 );

# we should take care of the saving after this
