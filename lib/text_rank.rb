require 'page_rank'

##
# Provides convenience methods for quickly extracting keywords.
#
# @see README
##
module TextRank

  autoload :CharFilter,       'text_rank/char_filter'
  autoload :GraphStrategy,    'text_rank/graph_strategy'
  autoload :KeywordExtractor, 'text_rank/keyword_extractor'
  autoload :RankFilter,       'text_rank/rank_filter'
  autoload :TokenFilter,      'text_rank/token_filter'
  autoload :Tokenizer,        'text_rank/tokenizer'
  autoload :VERSION,          'text_rank/version'

  # A convenience method for quickly extracting keywords from text with default options
  # @param text [String] text from which to extract keywords
  # @option (see KeywordExtractor.basic)
  # @return [Hash<String, Float>] of tokens and text rank (in descending order)
  def self.extract_keywords(text, **options)
    TextRank::KeywordExtractor.basic(**options).extract(text, **options)
  end

  # A convenience method for quickly extracting keywords from text with default advanced options
  # @param (see extract_keywords)
  # @option (see KeywordExtractor.advanced)
  # @return (see extract_keywords)
  def self.extract_keywords_advanced(text, **options)
    TextRank::KeywordExtractor.advanced(**options).extract(text, **options)
  end

end
