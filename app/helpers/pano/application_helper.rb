module Pano
  module ApplicationHelper

    # From CX::AppHelper

    def color_swatch(color_name)
      s "<div class='color-swatch #{color_name}'><span class='square'>&#9632;</span><span class='label'>#{color_name}</span></div>"
    end

    def header_title
      @nav.to_s.titleize
    end

    def subnav(&block)
      content_for :subnav do
        div_tag id: 'subnav' do
          capture(&block)
        end
      end
    end

    def absolute_root_url
      root_url(host: host_without_demo)
    end

    def host_without_demo
      request.host.gsub(/^demo./, '')
    end

    def host_with_demo
      'demo.' + host_without_demo
    end

  end
end
