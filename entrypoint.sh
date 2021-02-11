#!/bin/sh
set -eou pipefail

# Debug: just testing output while building
echo "### DEBUG ###"

pwd # /github/workspace, GITHUB_WORKSPACE dir if actions/checkout used

ls # project root's files

echo "1 $NEW_COVERAGE"                                              
#echo "2 ${{ env.NEW_COVERAGE }}"  

env | grep COVERAGE


echo "### END DEBUG ###"


# run the user supplied function(s)

for f in ./.github/update_stats/*.sh; do source $f; done


# we should take care of the saving after this
