# Pact standalone e2e example

Code base to use for demonstrating features or recreating issues in the Ruby standalone implementation of Pact. Please fork it and modify to demonstrate or recreate your own code.

This code base is _not_ intended as an example of a best practice Pact implementation. Its purpose is to create a running example with the simplest code possible.

## Usage

### Fork and clone the codebase

    # Fork the repository using the 'Fork' button on the repository home page, then:
    git clone git@github.com:YOUR_USERNAME/pact-ruby-standalone-e2e-example.git
    cd pact-ruby-e2e-example

### Install the relevant version

Set the `VERSION` in the `script/install.sh` to the version you are using and run `script/install.sh` (assumes you are on OSX or Linux). This will install the pact executable in `./pact`.

### Set up the consumer expectations

Modify the `script/consumer-interaction.json` file to create your interaction. Note that you will have to hand code any matchers you want to use, using either the original Ruby syntax or the v2+ matching rules (see the [pact-specification][pact-specification] for more information).

### "Implement" the provider

Modify the `script/provider-config.ru` to match your provider's behaviour

### Run the example

Execute `script/run.sh`.

You can run just the consumer side or provider side of the process by calling `script/consumer-create-pact.sh` or `script/provider-verify-pact.sh`.

## Reporting an issue

* Commit your code on a branch (so you can easily reuse the repository for other issues) and push it to your fork

      git checkout -b "foo-issue"
      git add .
      git commit -m "Modifying code to recreate my issue"
      git push --set-upstream origin foo-issue

* Open an issue in the appropriate codebase (see [pact-foundation][pact-foundation] for most of the repositories) and include a link to your branch.

[pact-foundation]: https://github.com/pact-foundation
[pact-specification]: https://github.com/pact-foundation/pact-specification/tree/version-2
