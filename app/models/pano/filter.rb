module Pano
  class Filter

    attr_accessor :dimension, :selected, :url

    def initialize(dimension, selected, url)
      self.dimension = dimension
      self.selected  = selected
      self.url       = url
    end

    def to_label
      return "#{dimension}: #{selected}" if dimension == 'Sort By'
      return "#{dimension}: #{selected.truncate(60)}" if selected.is_a?(String)
      if selected.size > 2
        "#{self.dimension}: #{selected.size} selected"
      else
        "#{selected.to_sentence(words_connector: ' or ', two_words_connector: ' or ', last_word_connector: ' or ').truncate(60)}"
      end
    end

  end
end
