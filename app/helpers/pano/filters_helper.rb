module Pano
  module FiltersHelper
    def clear_filters_link(url, remote: false)
      link_to 'Clear All', url, class: 'delete', title: 'Clear all selected filters', remote: remote
    end

    def list_filters(filters, remote: false)
      safe_join(filters.collect do |filter|
        s_link_to "#{h filter.to_label} #{icon 'close'}", filter.url, class: 'active-filter tag', remote: remote
      end)
    end

  end
end
