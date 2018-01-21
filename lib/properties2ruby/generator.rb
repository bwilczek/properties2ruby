module Properties2Ruby
  module Generator
    def generate(hash, prefix = '')
      ret = ''
      hash.each_pair do |k, v|
        ret << case v
               when Hash
                 generate(v, prefix + k.to_s + '.')
               when Array
                 'No support for Array yet'
               else
                 "#{prefix}#{k}=#{v}\n"
               end
      end
      ret
    end
  end
end
