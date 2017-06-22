module Pano
  module AppHelper

    def centered_app_page_header(header_data)
      div_tag class: 'centered-page-header' do
        content = []
        content << header_data[:back_link] if header_data[:back_link]
        content << header_data[:right_button] if header_data[:right_button]
        content << image_tag(header_data[:icon], class: 'header-icon') if header_data[:icon]
        content << h1_tag(header_data[:title])
        content << p_tag(header_data[:subtitle], class: 'intro') if header_data[:subtitle]
        content << p_tag(header_data[:button]) if header_data[:button]
        safe_join content
      end
    end

  end
end
