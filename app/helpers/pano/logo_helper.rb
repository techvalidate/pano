module Pano
  module LogoHelper

    # options[:size] specifies which image size to use. defaults to :collect
    def logo_image_tag(logo, options = {})
      size = options.delete(:size) || :collect

      # ghetto-retina sizing
      options[:width]  = options[:width]  || logo.instance.logo_width(size)   / 2
      options[:height] = options[:height] || logo.instance.logo_height(size)  / 2

      options[:style] = 'outline: none; text-decoration: none; -ms-interpolation-mode: bicubic;'

      options.add_class 'logo'

      image_tag logo.url(size), options
    end

  end
end
