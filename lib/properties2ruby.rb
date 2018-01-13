require 'java-properties'
require_relative 'properties2ruby/config'

module Properties2Ruby
  class << self
    def parse(string)
      ret = {}
      raw_hash = JavaProperties.parse(string)
      raw_hash.each_pair do |key, value|
        ret[key] = parse_scalar(value)
      end
      ret
    end

    def generate(hash)
      hash.class.name
    end

    private

    def parse_scalar(string)
      return true if string == 'true'
      return false if string == 'false'
      # rubocop:disable Style/RescueModifier
      return Float(string.to_s) rescue nil
      return Integer(string.to_s) rescue nil
      # rubocop:enable Style/RescueModifier
      string
    end
  end
end
