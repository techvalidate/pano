module Pano
  class DateFormBuilder < ActionView::Helpers::FormBuilder
    def formatted_date_field(name, options = {})
      hidden = @template.hidden_field(@object_name, name)
      date = @template.tag('date-input', {name: "#{@object_name}[#{name}]", role: "textbox", value: @object.read_attribute(name) || @object.send(name), id: sanitize_to_id("#{@object_name}[#{name}]"), tabindex: 0, active: false}.update(options.stringify_keys))
      @template.safe_join([date, hidden])
    end

    def sanitize_to_id(name)
      name.to_s.delete("]").tr("^-a-zA-Z0-9:.", "_")
    end
  end
end