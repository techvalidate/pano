module Pano
  module BoxHelper

    def box(*args, &block)
      options = args.extract_options!

      title = h2_tag(args.first, class: [options[:header_class], 'box-title']) || ''

      link  = options.delete :top_link
      if link
        top_link = div_tag url_for(link), class: [options[:top_link_class], 'top-link']
      end

      header = div_tag class: 'box-header' do
        concat title
        concat top_link
      end

      div_tag options.add_class('box') do
        header + capture(&block)
      end
    end

  end
end
