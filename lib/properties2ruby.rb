require 'java-properties'
require 'active_support/core_ext/hash/deep_merge'
require_relative 'properties2ruby/config'

module Properties2Ruby
  class << self
    def parse(string)
      ret = {}
      raw_hash = JavaProperties.parse(string)
      raw_hash.each_pair do |key, value|
        ret.deep_merge! process_line(key, value)
      end
      try_convert_hash_to_array(ret)
    end

    def generate(hash)
      hash.class.name
    end

    private

    def process_line(key, value)
      head, tail = key.to_s.split('.', 2)
      if tail.nil?
        { key.to_sym => parse_value_string(value) }
      else
        { head.to_sym => process_line(tail, value) }
      end
    end

    def try_convert_hash_to_array(hash)
      puts "BW try_convert_hash_to_array"
      begin
        ret = []
        hash.keys.map(&:to_s).map { |k| Integer(k) }.each do |i|
          val = hash[i.to_s.to_sym]
          puts val
          puts val.is_a?(Hash)
          ret[i] = val.is_a?(Hash) ? try_convert_hash_to_array(val) : val
        end
        return ret
      rescue Exception => e
        puts e.message
        # TODO: process values from this hash as well
        return hash
      end
    end

    def parse_value_string(string)
      return true if string == 'true'
      return false if string == 'false'
      # rubocop:disable Style/RescueModifier
      return Integer(string.to_s) rescue nil
      return Float(string.to_s) rescue nil
      # rubocop:enable Style/RescueModifier
      string
    end
  end
end
