#!/usr/bin/env bash

# Usage:
# To run specs in all packages do `./test.sh`
# To run specs in a specific package named 'fs' do `PACKAGE_NAME=fs ./test.sh`

ROOT_DIRECTORY=$( cd $(dirname $0)/.. ; pwd -P )
PACKAGES_PATH=${ROOT_DIRECTORY}/packages
if [ "$PACKAGE_NAME" != "" ]; then
  PACKAGES_WITH_SPECS=$PACKAGE_NAME
else
  PACKAGES_WITH_SPECS=( "pundle" )
fi

for name in "${PACKAGES_WITH_SPECS[@]}"
do :
  cd ${PACKAGES_PATH}/${name}
  apm test
  if [ $? -eq 1 ]; then
    exit 1
  fi
done
