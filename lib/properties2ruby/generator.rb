module Properties2Ruby
  module Generator
    def generate(hash)
      ret = ''
      hash.each_pair do |k, v|
        ret << "#{k}=#{v}\n" if v.is_a? String
      end
      ret
    end
  end
end
