# puppet-stdlib_ext

[![Build Status](https://travis-ci.org/treydock/puppet-stdlib_ext.png)](https://travis-ci.org/treydock/puppet-stdlib_ext)

####Table of Contents

1. [Overview - What is the stdlib_ext module?](#overview)
2. [Usage - Configuration and customization options](#usage)
3. [Limitations - OS compatibility, etc.](#limitations)
4. [Development - Guide for contributing to the module](#development)
    * [Testing - Testing your configuration](#testing)

## Overview

The stdlib_ext provides additional functions for Puppet.

## Usage

TODO

## Limitations

TODO

## Development

### Testing

Testing requires the following dependencies:

* rake
* bundler

Install gem dependencies

    bundle install

Run unit tests

    bundle exec rake test

If you have Vagrant >= 1.2.0 installed you can run acceptance tests

    bundle exec rake beaker
