module Pano
  class PanoFormBuilder < ActionView::Helpers::FormBuilder
    def formatted_date_field(name, options = {})
      hidden_field = @template.hidden_field(@object_name, name, data: {target: 'hidden'})
      # Format value to be parseable by new Date() in IE11. Use to_time not to_date, to prevent date misalignment
      date = @template.tag('date-input', {name: "#{@object_name}[#{name}]", role: "textbox", value: @object.read_attribute(name) ? @object.read_attribute(name).to_time.iso8601 : (@object.send(name) ? @object.send(name).to_time.iso8601 : @object.send(name)), id: sanitize_to_id("#{@object_name}[#{name}]"), tabindex: 0, active: false}.update(options.stringify_keys))
      @template.safe_join([hidden_field, date])
    end

    # Overrides ActionView::Helpers::FormHelper search_field()
    def search_field(method, options = {})
      submit_button = @template.button_tag(type: 'submit') do
        @template.icon(:search)
      end
      super + submit_button
    end

    private

    def sanitize_to_id(name)
      name.to_s.delete("]").tr("^-a-zA-Z0-9:.", "_")
    end
  end
end