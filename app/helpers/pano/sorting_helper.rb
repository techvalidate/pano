module Pano
  module SortingHelper

    def sort_link(name, param, search, options = {})
      if search.send("sorting_#{param}?")
        # show that this is the selected sort param, and link to reverse the sort order
        if search.send("sort_by_#{param}?")
          link_to name, sort_url_on(search, "#{param}_reverse"), options.merge({class: 'sort-link selected desc', title: 'Click to toggle sort order'})
        else
          link_to name, sort_url_on(search, param), options.merge({class: 'sort-link selected asc', title: 'Click to toggle sort order'})
        end
      else
        # show link to sort by this param
        link_to name, sort_url_on(search, param), options.merge({class: 'sort-link', title: 'Click to sort'})
      end
    end

    # Take the current url with GET params and inject the passed hash as params
    # Removes :page param from paginate
    # Used on recipients table sorting
    def sort_url_on(search, sort)
      params = request.path_parameters.merge request.params
      params.delete(:page)
      params.delete(:commit)

      symbol = search.class.to_s.underscore
      search = params.delete(symbol) || {}
      search[:sort] = sort

      params = params.merge symbol => search
      url_for params
    end

  end
end
