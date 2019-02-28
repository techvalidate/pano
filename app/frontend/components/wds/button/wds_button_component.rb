# frozen_string_literal: true

module WdsButtonComponent
  extend Pano::ComponentHelper

  property :class_name, default: ''
  property :stretched, default: false
  property :size, default: 'md' # lg, md, sm
  property :color, default: 'primary' # primary, alt, secondary, muted, warning, upgrade, link, info
  property :button_type, default: 'button' # button, reset, submit
  property :variant, default: 'solid' # solid, ghost, text
  property :href, default: nil
  property :disabled, default: false
  property :icon_position, default: 'icon-left' # icon-left, icon-right, icon-only; Not React prop, but we need this for styling
  # Note: icons need the class .wds-icon-svg
end
