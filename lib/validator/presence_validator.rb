class PresenceValidator < Validator
  def call(obj)
    unless present? obj.send(@attr_name)
      raise ValidationError, ":#{@attr_name} can't be blank"
    end
  end

  def self.valid_options?(options)
    return true if options[:presence]
  end

  private

  def present?(val)
    val.respond_to?(:empty?) ? !val.empty? : val
  end
end
