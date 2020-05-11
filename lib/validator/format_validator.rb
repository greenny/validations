class FormatValidator < Validator
  def call(obj)
    unless obj.send(@attr_name).to_s.match?(@options[:format])
      raise ValidationError, ":#{@attr_name} invalid format"
    end
  end

  def self.valid_options?(options)
    return true if [String, Regexp].include? options[:format].class
  end
end
