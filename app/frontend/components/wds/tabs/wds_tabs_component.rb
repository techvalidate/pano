# frozen_string_literal: true

module WdsTabsComponent

  extend Pano::ComponentHelper

  property :align, default: 'left' # left, even, right, center
  property :full_width, default: false # Styling for tab content
  property :on_change, default: nil # function
  property :color, default: 'light' # primary, light, dark, transparent

end
