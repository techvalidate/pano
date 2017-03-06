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
    # button colors
    # ------------------------------------------------------------

    def primary_btn_to(label, options = {}, html_options = {})
      btn_to label, options, html_options.add_class('btn-primary')
    end

    # ------------------------------------------------------------
    # buttons with icons
    # ------------------------------------------------------------

    def icon_btn_to(icon_name, label, options = {}, html_options = {})
      btn_to safe_join([icon(icon_name), label]), options, html_options
    end

    # ------------------------------------------------------------
    # combination and other buttons
    # ------------------------------------------------------------

    def small_primary_btn_to(label, options = {}, html_options = {})
      btn_to label, options, html_options.add_class('btn-small btn-primary')
    end

    def small_icon_btn_to(icon_name, label, options = {}, html_options = {})
      small_btn_to safe_join([icon(icon_name), label]), options, html_options
    end

    def primary_icon_btn_to(icon_name, label, options = {}, html_options = {})
      primary_btn_to safe_join([icon(icon_name), label]), options, html_options
    end

    def small_primary_icon_btn_to(icon_name, label, options = {}, html_options = {})
      small_primary_btn_to safe_join([icon(icon_name), label]), options, html_options
    end

    def large_primary_btn_to(label, options = {}, html_options = {})
      btn_to label, options, html_options.add_class('btn-large btn-primary')
    end

  end

end
