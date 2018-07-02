module Pano
  module PaginationHelper
    def pagination_of(name, collection)
      [pagination_numbers_for(collection), name].join(' ')
    end

    def pagination_numbers_for(collection)
      return '0-0 of 0' if collection.blank?

      if collection.last_page?
        "#{delimit(collection.total_count - collection.size + 1)}-#{delimit collection.total_count} of #{delimit collection.total_count}"
      elsif collection.current_page == 1
        "1-#{delimit(collection.size)} of #{delimit collection.total_count}"
      else
        items_passed = (collection.current_page - 1) * collection.size
        "#{delimit(items_passed + 1)}-#{delimit(items_passed + collection.size)} of #{delimit collection.total_count}"
      end
    end

    def search_total(label)
      label = "Matching #{label}" if @search.query_or_filtered?
      delimited_pluralize @search.pagination.total_count, label
    end

  end

end
