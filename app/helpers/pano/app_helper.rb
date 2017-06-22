module Pano
  module AppHelper

    def centered_app_page_header(header_data)
      div_tag class: 'centered-page-header' do
        output = ''
        output += s(header_data[:back_link]) if header_data[:back_link]
        output += s(header_data[:right_button]) if header_data[:right_button]
        output += s(image_tag(header_data[:icon], class: 'header-icon')) if header_data[:icon]
        output += s(h1_tag(header_data[:title]))
        output += s(p_tag(header_data[:subtitle], class: 'intro')) if header_data[:subtitle]
        output += s(p_tag(header_data[:button])) if header_data[:button]
        s output
      end
    end

  end
end
