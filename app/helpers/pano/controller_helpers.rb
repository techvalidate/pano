module Pano
  module ControllerHelpers

    def detect_browser
      case request.user_agent
      when /iPhone/i
        request.variant = :mobile
      when /Android/i && /mobile/i
        request.variant = :mobile
      when /Windows Phone/i
        request.variant = :mobile
      else
        request.variant = :desktop
      end
    end

    #############################################################################
    #                              H E L P E R S                                #
    #############################################################################

    private

    def is_ie8_or_below?
      ua = request.env['HTTP_USER_AGENT']
      ua && ua.include?('MSIE') && (ua.include?('MSIE 8.0') || ua.include?('MSIE 7.0') || ua.include?('MSIE 6.0'))
    end

    def is_xhr? # Rails' request.xhr? does not work
      return true if request.env['HTTP_X_REQUESTED_WITH'] && request.env['HTTP_X_REQUESTED_WITH'].include?('XMLHttpRequest')
      false
    end

    # for rendering responses into modals
    def render_modal(template = nil)
      if template
        render template, layout: false, content_type: 'text/html'
      else
        render layout: false, content_type: 'text/html'
      end
    end

    def render_filtered(action)
      respond_to do |format|
        format.html
        format.json {
          render json: {
            html: render_to_string(action)
          }
        }
      end
    end

    def set_nav
      # To be overridden in subclasses
    end

    def set_time_zone
      Time.zone = cookies[:timezone] if cookies[:timezone].present?
    rescue ArgumentError
      # Invalid time zone from the browser, fall back to UTC
    end

    def ssl_configured?
      Rails.env.production? || Rails.env.staging? || Rails.env.preview?
    end

  end
end
