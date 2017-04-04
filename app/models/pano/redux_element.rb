module Pano
  include Pano::ElementHelper
  class ReduxElement

    attr_accessor :element_name, :data

    def initialize(element_name, data, options)
      self.element_name = element_name
      self.data = data
      self.options = options
      self.id = self.generate_id
    end

    def render
      data[:id] = id
      element element_name, data, options
    end

    def generate_id
      t = DateTime
      @id = t.now.strftime("%Y%m%d%k%M%S%L") # Get current date to the milliseconds
      @id = id.to_i.to_s(36)
      element_name + @id
    end
  end
end