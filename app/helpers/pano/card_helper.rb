module Pano
  #=====================
  #
  #
  #=====================
  module CardHelper
    def card(title = '', secondary = nil, &block)
      if title.nil?
        header = ''
      else
        header = card_header(title, secondary)
      end

      content = content_tag(:div, class: 'card-content') do
        capture(&block)
      end

      content_tag :div, class: 'card' do
        header + content
      end
    end

    def card_header(title, secondary = nil)
      content_tag :div, class: 'card-header' do
        h2_tag title, class: 'card-title'
      end
    end


    def small_card(title, &block)
      capture(&block)
    end

  end
end