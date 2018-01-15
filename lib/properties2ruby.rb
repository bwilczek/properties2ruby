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
      fix_nested_array_hashes(ret)
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

    ##
    # Recursicely converts hashes like { :'0' => 1, :'1' => 2 } to array [1, 2]
    def fix_nested_array_hashes(obj)
      return obj unless obj.is_a? Hash
      begin
        ret = []
        obj.keys.map(&:to_s).map { |k| Integer(k) }.each do |i|
          val = obj[i.to_s.to_sym]
          ret[i] = val.is_a?(Hash) ? fix_nested_array_hashes(val) : val
        end
        return ret
      rescue ArgumentError # from Integer(k)
        return obj.each { |k, v| obj.merge!(k => fix_nested_array_hashes(v)) }
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
