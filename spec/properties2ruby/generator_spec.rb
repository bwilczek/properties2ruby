require 'properties2ruby'

RSpec.describe Properties2Ruby::Generator do
  describe '#generate' do
    Helpers::SAMPLES.each do |s|
      it s[:name], s[:tags] do
        expect(Properties2Ruby.generate(s[:ruby]).chomp).to eq s[:text]
      end
    end
  end
end
