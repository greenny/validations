require './lib/validator'
require './lib/validator/format_validator'
require './lib/validator/presence_validator.rb'
require './lib/validator/type_validator.rb'
require './lib/validator_builder'
require './lib/validation_error'

module Validation
  def self.included(base)
    base.extend ClassMethods
  end

  def validate!
    self.class.validators.each { |v| v.call(self) }
    true
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  module ClassMethods
    attr_accessor :validators

    def validate(attr_name, options)
      @validators ||= []
      # TODO: Rewrite previous validators in case of duplication
      @validators += ValidatorBuilder.build(attr_name, options)
    end
  end
end
