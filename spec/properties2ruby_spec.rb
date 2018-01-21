require 'properties2ruby'

RSpec.describe Properties2Ruby do
  describe '#generate' do
    Helpers::SAMPLES.each do |spec|
      it spec[:name], spec[:tags] do
        expect(Properties2Ruby.generate(spec[:ruby]).chomp).to eq spec[:text]
      end
    end
  end

  describe '#parse' do
    Helpers::SAMPLES.each do |spec|
      it spec[:name], spec[:tags] do
        expect(Properties2Ruby.parse(spec[:text])).to eq spec[:ruby]
      end
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
