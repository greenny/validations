module ValidatorBuilder
  VAL = {
    presence: ::PresenceValidator,
    format: ::FormatValidator,
    type: ::TypeValidator
  }.freeze

  def self.build(attr_name, options)
    options.keys.each_with_object([]) do |k, res|
      klass = VAL[k]
      next unless klass&.valid_options?(options)

      # TODO: Add options validations
      # Test github

      res << klass.new(attr_name, options)
    end
  end
end
