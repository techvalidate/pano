module Pano
  module ElementHelper
    def element(redux_element, html_options = {}, &block)
      block_content = ''
      block_content += capture(&block) if block_given?
      redux_element.render(html_options, block_content)
    end
  end
end