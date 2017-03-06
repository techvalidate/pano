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
  end
end
