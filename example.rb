require './lib/validation'

class Record
  include Validation
  attr_accessor :name, :email
  validate :name, presence: false, type: String
  validate :name, format: '123'
end

r = Record.new
r.name = '123'
r.email = 'example@gmail.com'
p r.valid?
p r.validate!
p r.email = nil
p r.valid?
