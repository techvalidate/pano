module Pano
  ##############################################
  # ReduxElement is a builder for custom elements
  # that should be updated by redux. The instance
  # takes a props hash and html options, and
  # converts the props into a data-attribute
  #
  # A ReduxElement instance should be rendered
  # in a template using the `element helper
  ##############################################
  class ReduxElement
    include ActionView::Helpers::TagHelper

    attr_accessor :data, :element_name, :id, :options

    def initialize(element_name, data, id='', options = {})
      self.element_name = element_name
      self.data = data
      self.options = options
      self.id = id.empty? ? generate_id : id
    end

    def render(html_options = {}, content)
      data[:id] = id
      opts = {data: data}.merge(options)
      opts = opts.merge(html_options)
      content_tag element_name, raw(content), opts
    end

    def props
      data[:props]
    end

    def generate_id
      element_name + '_' + object_id.to_s
    end
  end
end