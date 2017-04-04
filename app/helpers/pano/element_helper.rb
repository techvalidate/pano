module Pano
  module ElementHelper
    def element(name, options, html_options={})
      opts = {data: options}.merge(html_options)
      tag name, opts
    end
  end
end