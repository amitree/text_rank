module TextRank
  class BloomFilter

    def initialize(tokens)
      n = tokens.size # number of filter elements

      if n.positive?
        b = 4  # bits per bucket
        m = n * b * 10 # number of filter buckets

        k = (0.7 * (m / n)).to_i # number of hash functions
        k = 1 if k <= 1

        bloom_filter = BloomFilter::Native.new(:size => m, :bucket => b, :raise => true, :hashes => k)
        tokens.each { |t| bloom_filter.insert(t) }

        bloom_filter
      end
    end
  end
end
