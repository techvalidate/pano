module Pano
  module SJRHelper

    # For easily updating the browser url in SJR responses.
    # Currently assumes you're using turbolinks.
    def push_state(url = request.fullpath)
      s "history.pushState({ turbolinks: true, position: history.state.position + 1 }, '', '#{url}' );"
    end

    # Update an element in the document (DOM id) with a partial.
    def update_element(element_id, partial_name, options = {})
      s "$('##{element_id}').html('#{j partial(partial_name, options)}');"
    end

    # Turbolinks redirection
    def visit_location(location)
      s "Turbolinks.visit('#{location}', {'action': 'replace'});"
    end
  end
end
