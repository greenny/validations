class TypeValidator < Validator
  def call(obj)
    unless obj.send(@attr_name).is_a?(@options[:type])
      raise ValidationError, ":#{@attr_name} invalid type"
    end
  end

  def self.valid_options?(options)
    return true if options[:type].is_a?(Class)
  end
end
