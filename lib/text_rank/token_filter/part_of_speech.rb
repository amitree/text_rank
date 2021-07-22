require 'engtagger'

module TextRank
  module TokenFilter
    ##
    # Token filter to keep only a selected set of parts of speech
    #
    # = Example
    #
    #   PartOfSpeech.new(parts_to_keep: %w[nn nns]).filter!(%w[
    #     all men are by nature free
    #   ])
    #   => ["men", "nature"]
    ##
    class PartOfSpeech
      PARTS_TO_KEEP = %w[nn nnp nnps nns jj jjr jjs vb vbd vbg vbn vbp vbz].freeze
      @@eng_tagger = EngTagger.new

      # Perform the filter
      # @param tokens [Array<String>]
      # @return [Array<String>]
      def self.filter!(tokens)
        last_pos_tag = 'pp'
        parts_to_keep = TextRank::BloomFilter.new(PARTS_TO_KEEP)

        tokens.keep_if do |token|
          last_pos_tag = pos_tag(token, last_pos_tag: last_pos_tag)
          parts_to_keep.include?(last_pos_tag)
        end
      end

      def self.pos_tag(token, last_pos_tag:)
        tag = @@eng_tagger.assign_tag(last_pos_tag, token) rescue nil
        'nn' if tag.nil? || tag == ''
      end

      private_class_method :pos_tag
    end
  end
end
