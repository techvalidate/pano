module Pano
  module EmailHelper
        
    def email_organization_logo(organization)
      # TODO: uncomment this when organization logo css is done (they appear distorted now)
      # if organization.logo.present?
      #   link_to logo_image_tag(@organization.logo, alt: organization.name), login_url
      # else
      #   organization.name
      # end
      organization.name
    end

    def email_button(button_text:, button_url:, height: '40px', width: '200px', text_color: '#fff', fill_color: '#00a8ff', stroke_color: '#00a8ff', font_size: '16px', css_class: 'btn')
      buttons = outlook_button button_text: button_text, button_url: button_url, height: height, width: width, text_color: text_color, fill_color: fill_color, stroke_color: stroke_color, font_size: font_size
      buttons += link_to button_text, button_url, class: css_class
      buttons
    end

    def email_font_stack
      s 'font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Helvetica Neue", sans-serif;'
    end

    def outlook_button(button_text:, button_url:, height: '40px', width: '200px', text_color: '#fff', fill_color: '#00a8ff', stroke_color: '#00a8ff', font_size: '16px')
      s "<!--[if mso]>
        <v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"#{button_url}\" style=\"height:#{height};width:#{width};v-text-anchor:middle;\" arcsize=\"60px\" strokecolor=\"#{stroke_color}\" fillcolor=\"#{fill_color}\">
        <w:anchorlock/>
        <v:textbox inset=\"0,0,0,0\">
          <center style='color:#{text_color}; #{email_font_stack} font-size:#{font_size};mso-line-height-rule:exactly;'>#{button_text}</center>
        </v:textbox>
        </v:roundrect>
        <![endif]-->"
    end

    def user_avatar_email(user:, show_in_outlook: true,  options: {})
      size = options.delete(:size) || :thumb
      style = "style='background-color:#{CXColor::user user}';"

      if user.avatar?
        if show_in_outlook
          # MS Outlook VML hax.
          s "<!--[if mso]>
          &nbsp;
          <v:roundrect xmlns:v='urn:schemas-microsoft-com:vml' xmlns:w='urn:schemas-microsoft-com:office:word' style='height:32px; width:32px; v-text-anchor:middle;' arcsize='50%' strokecolor='#{CXColor::user user}' fillcolor='#{CXColor::user user}' title='#{user.name}'>
          <v:imagedata src='#{user.avatar.url(size)}' style='width:32px; height:32px'></v:image>
          </v:roundrect>
          <span style='mso-hide:all; display: none;'>
          <![endif]-->
          #{image_tag(user.avatar.url(size), alt: user.name, title: user.name, class: 'user-avatar', size: '32x32')}
          <!--[if mso]></span><![endif]-->"
        else
          s "<!--[if mso]><span style='mso-hide:all; display: none;'><![endif]-->
            #{image_tag(user.avatar.url(size), alt: user.name, title: user.name, class: 'user-avatar', size: '32x32')}
            <!--[if mso]></span><![endif]-->"
        end
      else
        initials = ''
        initials = user.first_name.first if user.first_name.present?
        initials += user.last_name.first if user.last_name.present?
        if show_in_outlook
          # MS Outlook VML hax.
          s "<!--[if mso]>
          &nbsp;
          <v:roundrect xmlns:v='urn:schemas-microsoft-com:vml' xmlns:w='urn:schemas-microsoft-com:office:word' style='height:32px; width:32px; v-text-anchor:middle;' arcsize='50%' strokecolor='#{CXColor::user user}' fillcolor='#{CXColor::user user}' title='#{user.name}'>
          <w:anchorlock/>
          <v:textbox style='padding-left: 0; padding-top: 0; padding-right: 0; padding-bottom: 0; v-text-wrapping: off; layout-flow: horizontal'>
          <center style='color:#ffffff; font-family: sans-serif; font-size:14px;'>#{initials}</center>
          </v:textbox>
          </v:roundrect>
          <span style='mso-hide:all; display: none;'>
          <![endif]-->
          <span class='user-avatar avatar-#{user.name}' #{style} title='#{user.name}'>#{initials}</span>
          <!--[if mso]></span><![endif]-->"
        else
          s "<!--[if mso]><span style='mso-hide:all; display: none;'><![endif]-->
            <span class='user-avatar avatar-#{user.name}' #{style} title='#{user.name}'>#{initials}</span>
            <!--[if mso]></span><![endif]-->"
        end
      end
    end

    def email_meta_tags
      capture do
        concat tag :meta, content: 'width=device-width, initial-scale=1, maximum-scale=1', name: 'viewport'
        concat tag :meta, content: 'text/html; charset=UTF-8', 'http-equiv': 'Content-Type'
        concat tag :meta, content: 'IE=edge', 'http-equiv': 'X-UA-Compatible'
        concat tag :meta, charset: 'utf-8'
      end
    end
  end
end
