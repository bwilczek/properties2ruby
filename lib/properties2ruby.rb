require 'java-properties'
require 'active_support/core_ext/hash/deep_merge'
require_relative 'properties2ruby/config'
require_relative 'properties2ruby/parser'
require_relative 'properties2ruby/generator'

module Properties2Ruby
  class << self
    include Parser
    include Generator
  end
end
