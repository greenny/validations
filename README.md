# 
<img src="https://img.shields.io/badge/ruby%20-v2.5.1-brightgreen.svg" title="ruby-badge">

## Table of Contents

* [Description](#description)
* [Requirements](#system-requirements)
* [Setup](#setup)
* [Testing](#testing)

## Description
Using pure Ruby for validations without Rails

1. Implement custom Validation module that:
Contains a class method `validate`. This method takes two arguments: attribute name and options with validation types and rules. These are possible validation types (you can implement your own as well):
   * `presence` - requires an attribute to be neither nil nor an empty string.
      
      Usage example: `validate :name, presence: true`

   * `format` - requires an attribute to match the passed regular expression.
      
      Usage example: `validate :number, format: /A-Z{0,3}/`

   * `type` - requires an attribute to be an instance of the passed class.
      
      Usage example: `validate :owner, type: User`


2. Contains an instance method `validate!` which runs all checks and validations, that added to a class via the class method validate.In case of any mismatch it raises an exception with a message that says what exact validation failed.

3. Contains an instance method valid? that returns true if all validations pass and false if there is any validation fail.


## System Requirements

This application requires ruby to be installed to your local
machine:

* [Ruby](https://www.ruby-lang.org/en/)

## Setup

To setup this application locally, take the following steps:

* Clone or download this repository.
* Choose validations directory in your terminal
* Run bundle
* Run irb
  Type `require './lib/validation'`
  Now You could include Validation module to your class

## Testing

To test this application locally, take the following steps:

* Run `rspec` to run the test suite
* All 10 examples should pass

