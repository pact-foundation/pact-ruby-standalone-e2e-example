#!/usr/bin/env bash

rm -rf log/*.log
script/consumer-create-pact.sh
script/provider-verify-pact.sh
