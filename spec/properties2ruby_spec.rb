require 'properties2ruby'

RSpec.describe Properties2Ruby do
  describe '#parse' do
    describe 'a scalar' do
      it 'String' do
        expect(Properties2Ruby.parse('key=value')).to eq(key: 'value')
      end

      it 'Integer' do
        expect(Properties2Ruby.parse('key=123')).to eq(key: 123)
      end

      it 'Float' do
        expect(Properties2Ruby.parse('key=123.12')).to eq(key: 123.12)
      end

      it 'Boolean' do
        expect(Properties2Ruby.parse('key=true')).to eq(key: true)
      end
    end
  end
end
