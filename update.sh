#!/bin/bash
set -Eeuo pipefail

VERSIONS="9.5 9.6 10 11 12"

for version in $VERSIONS; do
    cp debugger-setup.sh $version
    sed -e 's/%%PG_VERSION%%/'"$version"'/g;' Dockerfile.template > "$version/Dockerfile"
done
