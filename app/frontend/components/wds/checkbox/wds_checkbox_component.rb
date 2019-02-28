# frozen_string_literal: true

module WdsCheckboxComponent
  
  extend Pano::ComponentHelper
  
  property :checked, default: false
  property :class_name, default: ''
  property :default_checked, default: false
  property :disabled, default: false
  property :id, default: nil
  property :label, default: nil
  property :name, default: ''
  property :on_blur, default: nil # function
  property :on_change, default: nil # function
  property :value, default: ''
  property :indeterminate, default: false

end
