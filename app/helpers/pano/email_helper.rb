module Pano
  module EmailHelper

    def email_button(button_text:, button_url:, height: '40px', width: '200px', text_color: '#fff', fill_color: '#00a8ff', stroke_color: '#00a8ff', font_size: '16px', css_class: 'btn', style: nil, arc_size: 100)
      # buttons = outlook_button button_text: button_text, button_url: button_url, height: height, width: width, text_color: text_color, fill_color: fill_color, stroke_color: stroke_color, font_size: font_size, arc_size: arc_size
      buttons = link_to button_text, button_url, class: css_class, style: style
      buttons
    end

    def email_font_stack
      s 'font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Helvetica Neue", sans-serif;'
    end

    def email_meta_tags
      capture do
        concat tag :meta, content: 'width=device-width, initial-scale=1, maximum-scale=1', name: 'viewport'
        concat tag :meta, content: 'text/html; charset=UTF-8', 'http-equiv': 'Content-Type'
        concat tag :meta, content: 'IE=edge', 'http-equiv': 'X-UA-Compatible'
        concat tag :meta, charset: 'utf-8'
        concat outlook_96_dpi_tags
      end
    end

    def outlook_96_dpi_tags
        s "<!--[if gte mso 9]><xml>
          <o:OfficeDocumentSettings>
          <o:AllowPNG/>
          <o:PixelsPerInch>96</o:PixelsPerInch>
          </o:OfficeDocumentSettings>
          </xml><![endif]-->"
    end

    def outlook_button(button_text:, button_url:, height: '40px', width: '200px', text_color: '#fff', fill_color: '#00a8ff', stroke_color: '#00a8ff', font_size: '16px', arc_size: 100)
      s "<!--[if mso]>
        <v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"#{button_url}\" style=\"height:#{height};width:#{width};v-text-anchor:middle;\" arcsize=\"#{arc_size}%\" strokecolor=\"#{stroke_color}\" fillcolor=\"#{fill_color}\">
        <w:anchorlock/>
        <v:textbox inset=\"0,0,0,0\">
          <center style='color:#{text_color}; #{email_font_stack} font-size:#{font_size};mso-line-height-rule:exactly;'>#{button_text}</center>
        </v:textbox>
        </v:roundrect>
        <![endif]-->"
    end

    def obfuscate_email(address)
      chunks = address.split('@')
      "#{chunks[0].chars.first}****@#{chunks[1]}"
    end

  end
end
