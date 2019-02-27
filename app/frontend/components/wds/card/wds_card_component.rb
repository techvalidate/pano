# frozen_string_literal: true

module WdsCardComponent
  
    extend Pano::ComponentHelper

    property :add_on, default: nil
    property :class_name, default: ''
    property :title, default: nil
    property :no_rule, default: false
    property :padding, default: false

end
