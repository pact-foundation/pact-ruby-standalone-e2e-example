#!/usr/bin/env bash

set -e

VERSION="1.52.1"

if [ "$(uname)" == "Darwin" ]; then
  OS="osx"
else
  # assume linux on travis
  OS="linux-x86_64"
fi

rm -rf pact
curl -LO https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v${VERSION}/pact-${VERSION}-${OS}.tar.gz
tar xzf pact-${VERSION}-${OS}.tar.gz

cp script/template/rackup pact/bin/rackup
chmod +x pact/bin/rackup
