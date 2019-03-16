module Pano
  class PanoFormBuilder < ActionView::Helpers::FormBuilder
    def formatted_date_field(name, options = {})
      hidden_field = @template.hidden_field(@object_name, name, data: {target: 'hidden'})
      date = @template.tag('date-input', {name: "#{@object_name}[#{name}]", role: "textbox", value: get_date_value(name), id: sanitize_to_id("#{@object_name}[#{name}]"), tabindex: 0, active: false}.update(options.stringify_keys))
      @template.safe_join([hidden_field, date])
    end

    # Overrides ActionView::Helpers::FormHelper search_field()
    def search_field(method, options = {})
      use_controller = options.delete(:use_controller)
      if use_controller
        submit_button = @template.button_tag(type: 'button', data: {action: 'form#submit'}) do
          @template.icon(:search)
        end
      else
        submit_button = @template.button_tag(type: 'submit') do
          @template.icon(:search)
        end
      end
      super + submit_button
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