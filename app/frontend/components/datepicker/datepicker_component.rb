# frozen_string_literal: true

module DatepickerComponent
    extend Pano::ComponentHelper
    property :model, required: true
    property :url
    property :start_attr, default: :start_on
    property :finish_attr, default: :finish_on
    property :submit_label, default: 'Apply Filter'
end
