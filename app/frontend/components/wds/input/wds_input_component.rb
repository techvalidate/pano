module WdsInputComponent

    extend Pano::ComponentHelper

    property :class_name, default: ''
    property :color, default: '' # success, warning
    property :size, default: 'md' # lg, md, sm
    property :stretched, default: false
    property :disabled, default: false
    property :error_message, default: ''
    property :id, default: ''
    property :input_ref, default: ''
    property :input_size, default: ''
    property :label, default: ''
    property :name, default: ''
    property :on_blur, default: ''
    property :on_change, default: ''
    property :value, default: ''
    property :placeholder, default: ''

end
