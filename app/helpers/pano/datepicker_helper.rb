module Pano
  module DatepickerHelper
    def date_picker(form_args = {})
      form_args[:data] = {target: 'datepicker.form'}
      partial 'pano/components/date_picker', form_args: form_args
    end
  end
end