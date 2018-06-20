module Pano
  module DatepickerHelper
    def date_picker(options = {})
      start_attr     = options.delete :start_attr || :start_on
      finish_attr    = options.delete :finish_attr || :finish_on
      submit_label   = options.delete :submit_label || 'Apply Filter'
      options[:data] = {target: 'datepicker.form'}

      partial 'pano/components/date_picker', form_args: options, start_attr: start_attr, finish_attr: finish_attr, submit_label: submit_label
    end
  end
end