module Pano
  module FormHelper

    def app_form_for(record_or_name_or_array, *args, &proc)
      options = args.extract_options!
      form_for(record_or_name_or_array, *(args << options.merge(builder: Pano::AppFormBuilder)), &proc)
    end

    # For embedding a search object into a form
    def embed_fields_for(search)
      params = []
      search.to_params.each do |key, value|
        if value.is_a?(Array)
          value.each do |v|
            params << hidden_field_tag("#{search.class.to_s.underscore}[#{key}][]", v.to_param)
          end
        else
          params << hidden_field_tag("#{search.class.to_s.underscore}[#{key}]", value.to_param)
        end
      end
      safe_join params
    end

    def loading_spinner
      s "<div id='loading-overlay-container' class='hidden'><div id='loading-overlay'>#{image_tag('spinners/basic-spinner.svg', alt: 'Loading', size: '48x48', class: 'loading-spinner')}</div></div>"
    end

    def inline_indeterminate_progress
      s "<div id='inline-progress'>#{image_tag('spinners/basic-spinner.svg', alt: 'Loading', size: '48x48', class: 'loading-spinner')}</div>"
    end

    # Options: remove, class, data, use_controller
    def search_form_for(object, url, options = {})
      remote = options.delete(:remote) ? true : false
      active = object.query.present?
      css_class = "search-field-container #{options[:class]}"

      options_data = options.delete(:data) || {}
      use_controller = options.delete(:use_controller)
      stimulus_controller = use_controller
      form_data = {}
      button_data = {}
      search_field_data = {}
      autocomplete = "on" # browser default is also on

      # use form controller for form submission
      if use_controller
        stimulus_controller = options_data[:controller] || 'form'
        form_data = options_data[:controller] ? options_data : options_data.merge({controller: 'form'})
        button_data = {action: "click->#{stimulus_controller}#submit"}

      elsif options.delete(:prevent_autocomplete_override)
        # Set autocomplete to off initially: Prevent the browser from updating (during page load) the input value to the last entered value
        # autocomplete causes input value to mismatch page content when navigating back/forward between searches
        # Turn autcomplete back on after page loads
        autocomplete = "off"
        search_field_data = {controller: 'enable-autocomplete'}
      end

      form_for object, options.merge({url: url, remote: remote, html: {method: :get, class: css_class}, builder: Pano::PanoFormBuilder, data: form_data}) do |f|
        f.search_field :query, placeholder: 'Search', class: selected_if(active), controller: stimulus_controller, button_data: button_data, data: search_field_data, autocomplete: autocomplete
      end
    end
  end
end
