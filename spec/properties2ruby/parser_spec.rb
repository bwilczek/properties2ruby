require 'properties2ruby'

RSpec.describe Properties2Ruby::Parser do
  describe '#parse' do
    describe 'a scalar' do
      it 'String' do
        input = 'key=value'
        output = { key: 'value' }
        expect(Properties2Ruby.parse(input)).to eq output
      end

      it 'Integer' do
        input = 'key=123'
        output = { key: 123 }
        expect(Properties2Ruby.parse(input)).to eq output
      end

      it 'Float' do
        input = 'key=123.12'
        output = { key: 123.12 }
        expect(Properties2Ruby.parse(input)).to eq output
      end

      it 'Boolean' do
        input = 'key=true'
        output = { key: true }
        expect(Properties2Ruby.parse(input)).to eq output
        expect(Properties2Ruby.parse('key=true')).to eq(key: true)
      end
    end

    describe 'an array' do
      it 'flat single line' do
        input = 'key.0=123'
        output = { key: [123] }
        expect(Properties2Ruby.parse(input)).to eq output
      end

      it 'nested single line' do
        input = 'key.0.0=123'
        output = { key: [[123]] }
        expect(Properties2Ruby.parse(input)).to eq output
      end

      it 'flat multi line' do
        input = "a.0=123\na.1=456"
        output = { a: [123, 456] }
        expect(Properties2Ruby.parse(input)).to eq output
      end

      it 'nested multi line' do
        input = "a.0.0=123\na.0.1=456"
        output = { a: [[123, 456]] }
        expect(Properties2Ruby.parse(input)).to eq output
      end
    end

    describe 'a hash' do
      it 'flat single line' do
        input = 'a.b=123'
        output = { a: { b: 123 } }
        expect(Properties2Ruby.parse(input)).to eq output
      end

      it 'nested single line' do
        input = 'a.b.c=123'
        output = { a: { b: { c: 123 } } }
        expect(Properties2Ruby.parse(input)).to eq output
      end

      it 'flat multli line' do
        input = "a.b=123\na.c=456"
        output = { a: { b: 123, c: 456 } }
        expect(Properties2Ruby.parse(input)).to eq output
      end

      it 'nested multli line' do
        input = "a.b.c=123\na.b.d=456"
        output = { a: { b: { c: 123, d: 456 } } }
        expect(Properties2Ruby.parse(input)).to eq output
      end
    end

    it 'mixed arrays and hashes' do
      input = "a.0.x=1\na.0.y=2"
      output = { a: [{ x: 1, y: 2 }] }
      expect(Properties2Ruby.parse(input)).to eq output
    end
  end

  describe '#fix_nested_array_hashes' do
    it 'converts hash when possible' do
      expect(Properties2Ruby.send(:fix_nested_array_hashes, '0': 123))
        .to eq [123]
    end

    it 'leaves hash as it was when impossible' do
      expect(Properties2Ruby.send(:fix_nested_array_hashes, a: 123))
        .to eq(a: 123)
    end
  end
end
