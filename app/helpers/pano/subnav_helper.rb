module Pano
  module SubnavHelper

    # todo: will this only be used by CX survey pages?
    def subnav_header(&block)
      content_for :subnav_header do
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
          div_tag id: 'subnav-contents' do
            capture(&block)
          end
        end
        str.safe_concat(div_tag '', id: 'subnav-shim')
      end
    end

    # a sticky-scrolling version of the subnav, without a shim element.
    # currently only used in conjunction with subnav_header on CX survey pages.
    def sticky_subnav(&block)
      content_for :subnav do
        div_tag id: 'subnav', class: 'sticky-subnav' do
          div_tag id: 'subnav-contents' do
            capture(&block)
          end
        end
      end
    end

  end
end
