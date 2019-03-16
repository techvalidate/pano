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

    def search_form_for(object, url, options = {})
      remote = options.delete(:remote) ? true : false
      active = object.query.present?
      css_class = "search-field-container #{options[:class]}"
      # use form controller for form submission
      use_controller = options.delete(:use_controller)
      form_data = use_controller ? {controller: 'form'} : {}
      button_data = use_controller ? {action: 'click->form#submit'} : {}
      form_for object, url: url, remote: remote, html: {method: :get, class: css_class}, builder: Pano::PanoFormBuilder, data: form_data do |f|
        f.search_field :query, placeholder: 'Search', class: selected_if(active), use_controller: use_controller
      end
    end
  end
end
