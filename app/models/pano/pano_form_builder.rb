module Pano
  class PanoFormBuilder < ActionView::Helpers::FormBuilder
    def formatted_date_field(name, options = {})
      hidden_field = @template.hidden_field(@object_name, name, data: {target: 'hidden'})
      date = @template.tag('date-input', {name: "#{@object_name}[#{name}]", role: "textbox", value: get_date_value(name), id: sanitize_to_id("#{@object_name}[#{name}]"), tabindex: 0, active: false}.update(options.stringify_keys))
      @template.safe_join([hidden_field, date])
    end

    # Overrides ActionView::Helpers::FormHelper search_field()
    def search_field(method, options = {})
      stimulus_controller = options.delete(:controller)
      button_data = options.delete(:button_data)
      if stimulus_controller
        submit_button = @template.link_to('', class: 'submit', data: {remote: true, target: "#{stimulus_controller}.submit"}.merge(button_data)) do
          @template.icon(:search)
        end

        super(method, data: {target: "#{stimulus_controller}.search"}) + submit_button
      else
        submit_button = @template.button_tag(type: 'submit') do
          @template.icon(:search)
        end

        super(method) + submit_button
      end
    end

    private

    def sanitize_to_id(name)
      name.to_s.delete("]").tr("^-a-zA-Z0-9:.", "_")
    end

    def get_date_value(name)
      # get name attribute or invoke name method for datetime value
      # value should be in the local timezone with the timezone specified
      value = @object.read_attribute(name) || @object.send(name)

      # NOTE: If value does not have timezone info, value.iso8601 will not contain timezone info either.
      # This can cause problems when the client assumes value is in UTC (although it may already be in the local timezone), and then converts it from UTC to the local timezone
      # Format to iso8601 so IE11 new Date() can parse it
      value.present? ? value.iso8601 : value
    end
  end
end