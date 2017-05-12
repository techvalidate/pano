module Pano
  module CSSHelper

    # this is useful for cases where you want to make sure a specific css class
    # gets added to an options hash, but also allow extra css classes to be included
    def options_plus_class(options, css_class)
      return { class: css_class } if options.nil?
      if options.key?(:class)
        options.merge!(class: "#{options[:class]} #{css_class}")
      else
        options.merge!(class: css_class)
      end
    end

    def color_swatch(color_name)
      s "<div class='color-swatch'><span class='color #{color_name}'>&#9679;</span><span class='label'>#{color_name}</span></div>"
    end

    def trademark
      s "<span class='trademark'>TM</span>"
    end

    def circle_r
      s "<span class='trademark'>&reg;</span>"
    end

  end
end
