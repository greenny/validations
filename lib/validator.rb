class Validator
  attr_accessor :attr_name

  def initialize(attr_name, options)
    @attr_name = attr_name
    @options = options
  end
end
