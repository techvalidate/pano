module Pano
  module SubnavHelper

    def subnav_header(&block)
      content_for :subnav do
        div_tag id: 'subnav-header' do
          div_tag class: 'header-contents' do
            capture(&block)
          end
        end
      end
    end

    def subnav(&block)
      content_for :subnav do
        str = div_tag id: 'subnav' do
          div_tag id: 'subnav-links', class: 'tabs' do
            capture(&block)
          end
        end
        str.safe_concat(div_tag '', id: 'subnav-shim')
      end
    end

    def sticky_subnav(&block)
      content_for :subnav do
        div_tag id: 'subnav', class: 'sticky-subnav' do
          div_tag id: 'subnav-links', class: 'tabs' do
            capture(&block)
          end
        end
      end
    end

  end
end
