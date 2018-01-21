module Properties2Ruby
  module Generator
    def generate(val, prefix = '')
      ret = ''
      val.each_with_index do |v, k|
        # a hack for each_with_index. It behaves differently for Hash and Array
        k, v = v if val.is_a?(Hash)
        ret << if v.is_a?(Enumerable)
                 generate(v, prefix + k.to_s + '.')
               else
                 "#{prefix}#{k}=#{v}\n"
               end
      end
      ret
    end
  end
end
