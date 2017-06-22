module Pano
  module ApplicationHelper

    def absolute_root_url
      root_url(host: host_without_demo)
    end

    def host_without_demo
      request.host.gsub(/^demo./, '')
    end

    def host_with_demo
      'demo.' + host_without_demo
    end

  end
end
