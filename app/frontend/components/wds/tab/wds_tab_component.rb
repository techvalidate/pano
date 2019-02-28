# frozen_string_literal: true

module WdsTabComponent

  extend Pano::ComponentHelper

  property :title, default: ''
  property :disabled, default: false
  property :id, default: nil
  property :inner_ref, default: nil # function
  property :on_change, default: nil # function
  property :selected, default: false
  property :value, default: 0 # number

end
