module Pano
  module ComponentHelper
    def component(name, options = {})
      partial "components/#{name}", options
    end
  end
end