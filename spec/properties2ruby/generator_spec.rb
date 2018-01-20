require 'properties2ruby'

RSpec.describe Properties2Ruby::Generator do
  describe '#generate' do
    describe 'a scalar' do
      it 'String' do
        input = { key: 'value' }
        output = "key=value\n"
        expect(Properties2Ruby.generate(input)).to eq output
      end
    end
  end
end
