#!/usr/bin/env bash

# start provider server
pact/bin/rackup script/provider-config.ru -p 9292 &
provider_pid="$!"

# verify pact
pact/bin/pact-provider-verifier verify pacts/foo-bar.json --provider-base-url http://localhost:9292 \
   --custom-provider-header Foo1:bar1 --custom-provider-header Foo2:bar2

# stop provider server
kill -9 $provider_pid
