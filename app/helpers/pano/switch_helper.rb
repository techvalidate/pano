include Pano::ComponentHelper
include Pano::PartialHelper

module Pano
  module SwitchHelper
    def switch_toggle(form, **options)
      label            = options.delete :label || ''
      attribute        = options.delete :attribute
      submit_on_change = options.delete :submit_on_change

      builder = ToggleBuilder.new(self, form)

      content_tag :div, class: 'switch-toggle', data: {controller: 'switch'} do
        if block_given?
          capture(builder, &Proc.new)
        else
          builder.with_checkbox attribute, label, submit_on_change
        end
      end
    end

    class ToggleBuilder
      def initialize(template, form = nil)
        @form     = form if form
        @template = template
      end

      def with_checkbox(attribute, label = '', submit_on_change = false)
        actions = 'change->switch#toggle'
        actions += ' change->switch#submit' if submit_on_change
        # Work around for different app_form_for vs form_with checkbox templates
        data = {data: {target: 'switch.checkbox', action: actions}}
        builder = @form.class.name.split('::')[2]

        if builder == 'FormBuilder'
          arguments = [attribute, data]
        else
          arguments = [attribute, 'Engaged', data]
        end
        controller = @form.check_box *arguments

        @template.component 'switch', controller: @template.safe_join([controller]), label: label || ''
      end

      def toggle(label, selected = false)
        actions = 'change->switch#toggle'
        data = {data: {target: 'switch.checkbox', action: actions}}
        @template.component 'switch', label: label, data: data, selected: selected
      end
    end
  end
end