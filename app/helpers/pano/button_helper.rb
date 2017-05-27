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

    def huge_btn_to(label, options = {}, html_options = {})
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

    def icon_btn_to(icon_name, label, options = {}, html_options = {})
      btn_to safe_join([icon(icon_name), label]), options, html_options
    end

  end

end
