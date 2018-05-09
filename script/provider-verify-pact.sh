#!/usr/bin/env bash

# start provider server
# pact/bin/rackup script/provider-config.ru -p 9292 &
ruby script/provider_with_no_rack.rb &
provider_pid="$!"

# verify pact
pact/bin/pact-provider-verifier verify --pact-urls pacts/foo-bar.json --provider-base-url http://localhost:9292

# stop provider server
kill -9 $provider_pid
