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

    describe 'an array' do
      it 'flat single line' do
        expect(Properties2Ruby.parse('key.0=123')).to eq(key: [123])
      end

      it 'nested single line' do
        expect(Properties2Ruby.parse('key.0.0=123')).to eq(key: [[123]])
      end

      it 'flat multi line' do
        expect(Properties2Ruby.parse("a.0=123\na.1=456")).to eq(a: [123, 456])
      end

      it 'nested multi line' do
        expect(Properties2Ruby.parse("a.0.0=123\na.0.1=456")).to eq(a: [[123, 456]])
      end
    end

    describe 'a hash' do
      it 'flat single line' do
        expect(Properties2Ruby.parse('a.b=123')).to eq(a: { b: 123 })
      end

      it 'nested single line' do
        expect(Properties2Ruby.parse('a.b.c=123')).to eq(a: { b: { c: 123 } })
      end

      it 'flat multli line' do
        expect(Properties2Ruby.parse("a.b=123\na.c=456")).to eq(a: { b: 123, c: 456 })
      end

      it 'nested multli line' do
        expect(Properties2Ruby.parse("a.b.c=123\na.b.d=456")).to eq(a: { b: { c: 123, d: 456 } })
      end
    end

    it 'mixed arrays and hashes' do
      [
        { in: "a.0.x=1\na.0.y=2", out: { a: [{ x: 1, y: 2 }] } }
      ].each { |pair| expect(Properties2Ruby.parse(pair[:in])).to eq pair[:out] }
    end
  end

  describe '#fix_nested_array_hashes' do
    it 'converts hash when possible' do
      expect(Properties2Ruby.send(:fix_nested_array_hashes, '0': 123)).to eq [123]
    end

    it 'leaves hash as it was when impossible' do
      expect(Properties2Ruby.send(:fix_nested_array_hashes, a: 123)).to eq(a: 123)
    end
  end
end
