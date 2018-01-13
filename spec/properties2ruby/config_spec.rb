require 'properties2ruby'

RSpec.describe Properties2Ruby do
  describe 'configuration' do
    it 'implements Configurable' do
      expect { Properties2Ruby.config.my_field = 123 }.not_to raise_error
      expect(Properties2Ruby.config.my_field).to eq 123
    end

    it 'has the right defaults' do
      expect(Properties2Ruby.config.separator).to eq '='
    end
  end
end
