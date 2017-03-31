module Pano
  class Link
    attr_accessor :name, :options, :selected, :url

    def initialize(name, url, options = {}, selected = false)
      self.name     = name
      self.url      = url
      self.selected = selected
      self.options  = options
    end

    def selected?
      selected
    end
  end
end
