module Pano
  module ButtonHelper

    # ------------------------------------------------------------
    # base button helper
    # ------------------------------------------------------------

    def btn_to(label, options = {}, html_options = {})
      s link_to(label, options, html_options.add_class('btn'))
    end

    # ------------------------------------------------------------
    # button sizes
    # ------------------------------------------------------------

    def huge_btn_to(label, options= {}, html_options = {})
      btn_to label, options, html_options.add_class('btn-huge')
    end

    def large_btn_to(label, options = {}, html_options = {})
      btn_to label, options, html_options.add_class('btn-large')
    end

    def small_btn_to(label, options = {}, html_options = {})
      btn_to label, options, html_options.add_class('btn-small')
    end

    def tiny_btn_to(label, options = {}, html_options = {})
      btn_to label, options, html_options.add_class('btn-tiny')
    end

    # ------------------------------------------------------------
    # buttons with icons
    # ------------------------------------------------------------

    # this is for icon-only buttons. if you give the button an title attribute,
    # it will automatically be made into a tooltip
    def icon_btn(icon_name, options = {}, html_options = {})
      css_classes = 'btn icon-only'
      css_classes += ' js-tooltip' if html_options[:title]
      link_to icon(icon_name), options, html_options.add_class(css_classes)
    end

    # this is for buttons with icons and text
    def icon_btn_to(icon_name, label, options = {}, html_options = {})
      if html_options[:right]
        btn_to safe_join([label, icon(icon_name)]), options, html_options.add_class('icon-rt')
      else
        btn_to safe_join([icon(icon_name), label]),  options, html_options
      end
    end

    # ------------------------------------------------------------
    # back button
    # ------------------------------------------------------------

    # Use Rails special :back token when a referrer is available
    # AND it will not send you to the same page
    # If that default logic still doesn't work, accepts an override :force option

    def back_btn_to(label, options = {}, html_options = {})
      unless html_options[:force]
        options = :back if request.referer.present? && url_for(options) != request.referer
      end
      icon_btn_to(:back, label, options, html_options.add_class('btn-white btn-back'))
    end

  end

end
