module TextRank
  module TokenFilter
    ##
    # Token filter to remove "small" tokens
    #
    # = Example
    #
    #  MinLength.new(min_length: 6).filter!(%w[
    #    and ask each passenger to tell his story and if there is one of them all who has not
    #    cursed his existence many times and said to himself over and over again that he was
    #    the most miserable of men i give you permission to throw me head-first into the sea
    #  ])
    #  => ["passenger", "cursed", "existence", "himself", "miserable", "permission", "head-first"]
    ##
    class MinLength
      # Perform the filter
      # @param tokens [Array<String>]
      # @return [Array<String>]
      def self.filter!(tokens, min_length: 3, **_)
        tokens.keep_if do |token|
          token.size >= min_length
        end
      end

    end
  end
end
