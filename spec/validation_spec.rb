require_relative '../lib/validation'

RSpec.describe 'RPNCalculator' do
  let(:dummy_class) do
    Class.new do
      include Validation
      attr_accessor :email
    end
  end

  describe '.validate' do
    it 'assigns validators' do
      dummy_class.validate :email, {
        presence: true,
        type: String,
        format: /\A[^@]+@.+\z/
      }

      klasses = dummy_class.validators.map(&:class)

      expect(klasses).to eq([PresenceValidator, TypeValidator, FormatValidator])
    end

    it 'skip assign validators with invalid options' do
      dummy_class.validate :email, presence: false, type: 12, format: 45
      validator_classes = dummy_class.validators.map(&:class)

      expect(validator_classes).to be_empty
    end
  end

  describe '#validate!' do
    before do
      dummy_class.validate :email, {
        presence: true,
        type: String,
        format: /\A[^@]+@.+\z/
      }
    end

    it 'returns true' do
      instance = dummy_class.new
      instance.email = 'example@google.com'

      expect(instance.validate!).to be_truthy
    end

    it 'raises error on attribute absence' do
      instance = dummy_class.new

      expect { instance.validate! }.to raise_error(ValidationError, ":email can't be blank")
    end

    it 'raises error on attribute type mismatch' do
      instance = dummy_class.new
      instance.email = 12

      expect { instance.validate! }.to raise_error(ValidationError, ':email invalid type')
    end

    it 'raises error on attribute format mismatch' do
      instance = dummy_class.new
      instance.email = '12'

      expect { instance.validate! }.to raise_error(ValidationError, ':email invalid format')
    end
  end

  describe '#valid?' do
    before do
      dummy_class.validate :email, {
        presence: true,
        type: String,
        format: /\A[^@]+@.+\z/
      }
    end

    it 'returns true' do
      instance = dummy_class.new
      instance.email = 'example@google.com'

      expect(instance.valid?).to be_truthy
    end

    it 'returns false on attribute absence' do
      instance = dummy_class.new

      expect(instance.valid?).to be_falsey
    end

    it 'returns false on attribute type mismatch' do
      instance = dummy_class.new
      instance.email = 12

      expect(instance.valid?).to be_falsey
    end

    it 'returns false on attribute format mismatch' do
      instance = dummy_class.new
      instance.email = '12'

      expect(instance.valid?).to be_falsey
    end
  end
end
