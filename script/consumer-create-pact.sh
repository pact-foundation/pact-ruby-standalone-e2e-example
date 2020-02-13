#!/usr/bin/env bash

# start mock service
pact/bin/pact-mock-service start -p 1234 --pact-dir ./pacts --ssl --sslcert support/self-signed-cert.pem --sslkey support/self-signed-key.pem --log ./log/foo-bar-mock-service.log

export SSL_CERT_FILE=support/self-signed-cert.pem
# clear interactions (not necessary for this example, just showing how)
curl -X DELETE -H "X-Pact-Mock-Service: true"  https://localhost:1234/interactions

# set up interaction
curl -X POST -H "X-Pact-Mock-Service: true" -d@script/consumer-interaction.json https://localhost:1234/interactions

# execute interaction
curl https://localhost:1234/foo

# verify interaction took place
curl -H "X-Pact-Mock-Service: true" https://localhost:1234/interactions/verification

# write pact
curl -X POST -H "X-Pact-Mock-Service: true" -d '{"consumer": {"name": "Foo"}, "provider": {"name": "Bar"}}' https://localhost:1234/pact

# stop mock service
pact/bin/pact-mock-service stop -p 1234
