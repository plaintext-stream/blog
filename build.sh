#!/bin/bash

set -e

VERSION="$(curl -sS https://api.github.com/repos/gohugoio/hugo/releases/latest | python3 -c 'import sys,json; print(json.load(sys.stdin)["tag_name"][1:])')"

echo "Build for Cloudflare Workers..."

echo "-> Get Hugo v${VERSION}"
curl \
    -sSL "https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_linux-amd64.tar.gz" \
    -o "hugo.tar.gz"

echo "-> Unarchive"
tar -xf ./hugo.tar.gz

echo "-> Build site"
./hugo build

echo "Success"
