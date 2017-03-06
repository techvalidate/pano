module Pano
  module ResqueHelper

    def resque_pagination(start:, total:)
      per_page = 30

      return if total < per_page

      content_tag :p do
        concat link_to('previous', params.permit.merge(start: (start - per_page))) if start - per_page >= 0
        concat link_to('next', params.permit.merge(start: (start + per_page)))     if start + per_page <= total
      end
    end

  end
end
