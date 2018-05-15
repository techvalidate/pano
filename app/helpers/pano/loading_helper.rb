module Pano
  module LoadingHelper
    def loading_dots
      content_tag :div, class: 'loading-dots' do
        dot = div_tag
        dot + dot + dot
      end
    end
  end
end