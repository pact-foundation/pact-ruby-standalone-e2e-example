# Pact standalone e2e example

[![Build Status](https://travis-ci.org/pact-foundation/pact-ruby-standalone-e2e-example.svg?branch=master)](https://travis-ci.org/pact-foundation/pact-ruby-standalone-e2e-example)

Code base to use for demonstrating features or recreating issues in the Ruby standalone implementation of Pact. Please fork it and modify to demonstrate or recreate your own code.

This code base is _not_ intended as an example of a best practice Pact implementation. Its purpose is to create a running example with the simplest code possible.

## Usage

### Fork and clone the codebase

    # Fork the repository using the 'Fork' button on the repository home page, then:
    git clone git@github.com:YOUR_USERNAME/pact-ruby-standalone-e2e-example.git
    cd pact-ruby-standalone-e2e-example

### Install the relevant version of the pact standalone package

Set the `VERSION` in the `script/install.sh` to the version you are using and run `script/install.sh` (assumes you are on OSX or Linux). This will install the pact executable in `./pact`.

### Set up the consumer expectations

Modify the `script/consumer-interaction.json` file to create your interaction. Note that you will have to hand code any matchers you want to use, using either the original Ruby syntax or the v2+ matching rules (see the [pact-specification][pact-specification] for more information).

### How we can use below statements, if we have multiple interactions and want to register all interactions together.
# set up interaction
curl -X POST -H "X-Pact-Mock-Service: true" -d@script/consumer-interaction.json localhost:1234/interactions

Error after above command
curl -X POST -H "X-Pact-Mock-Service: true" -d@script/consumer-interaction.json localhost:1234/interactions
{"message":"Error ocurred in mock service: TypeError - no implicit conversion of String into Integer","backtrace":["/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/pact-support-1.16.7/lib/pact/consumer_contract/interaction_v2_parser.rb:15:in `[]'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/pact-support-1.16.7/lib/pact/consumer_contract/interaction_v2_parser.rb:15:in `call'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/pact-support-1.16.7/lib/pact/consumer_contract/interaction_parser.rb:16:in `parse_v2_interaction'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/pact-support-1.16.7/lib/pact/consumer_contract/interaction_parser.rb:10:in `call'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/pact-support-1.16.7/lib/pact/consumer_contract/interaction.rb:22:in `from_hash'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/pact-mock_service-3.9.0/lib/pact/mock_service/request_handlers/interaction_post.rb:26:in `respond'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/pact-mock_service-3.9.0/lib/pact/mock_service/request_handlers/base_request_handler.rb:17:in `call'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/rack-2.1.4/lib/rack/cascade.rb:35:in `block in call'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/rack-2.1.4/lib/rack/cascade.rb:26:in `each'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/rack-2.1.4/lib/rack/cascade.rb:26:in `call'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/pact-mock_service-3.9.0/lib/pact/consumer/mock_service/cors_origin_header_middleware.rb:11:in `call'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/pact-mock_service-3.9.0/lib/pact/consumer/mock_service/error_handler.rb:13:in `call'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/pact-mock_service-3.9.0/lib/pact/mock_service/app.rb:34:in `call'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/pact-mock_service-3.9.0/lib/pact/consumer/mock_service/set_location.rb:14:in `call'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/rack-2.1.4/lib/rack/handler/webrick.rb:88:in `service'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/webrick-1.3.1/lib/webrick/httpserver.rb:138:in `service'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/webrick-1.3.1/lib/webrick/httpserver.rb:94:in `run'","/Users/ratngupta/github/openapi-swagger-parser/pact/lib/vendor/ruby/2.2.0/gems/webrick-1.3.1/lib/webrick/server.rb:191:in `block in start_thread'"]}%    

# execute interaction
curl localhost:1234/foo

.........................................................................................

### "Implement" the provider

Modify the `script/provider-config.ru` to match your provider's behaviour

### Run the example

Execute `script/run.sh`

You can run just the consumer side or provider side of the process by calling `script/consumer-create-pact.sh` or `script/provider-verify-pact.sh`

## Reporting an issue

* Commit your code on a branch (so you can easily reuse the repository for other issues) and push it to your fork

      git checkout -b "issue/my-issue"
      git add .
      git commit -m "chore: modify code to recreate my issue"
      git push --set-upstream origin issue/my-issue

* Open an issue in the appropriate codebase (see [pact-foundation][pact-foundation] for most of the repositories) and include a link to your branch.

[pact-foundation]: https://github.com/pact-foundation
[pact-specification]: https://github.com/pact-foundation/pact-specification/tree/version-2
