module Pano
  module ElementHelper
    def element(element, html_options = {}, &block)
      element.render(html_options, &block)
    end
  end
end