require 'active_support/configurable'

module Properties2Ruby
  include ActiveSupport::Configurable
  config.separator = '='
end
