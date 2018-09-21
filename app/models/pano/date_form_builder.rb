module Pano
  class DateFormBuilder < ActionView::Helpers::FormBuilder
    def formatted_date_field(name, options = {})
      hidden_field = @template.hidden_field(@object_name, name)

      @template.content_tag('date-input', {name: "#{@object_name}[#{name}]", role: "textbox", value: @object.read_attribute(name) || @object.send(name), id: sanitize_to_id("#{@object_name}[#{name}]"), tabindex: 0, active: false}.update(options.stringify_keys)) do
        hidden_field
      end
    end

    def sanitize_to_id(name)
      name.to_s.delete("]").tr("^-a-zA-Z0-9:.", "_")
    end
  end
end