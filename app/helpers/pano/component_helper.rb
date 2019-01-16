module Pano
  module ComponentHelper
    def property(name, options = {})
      @properties[name] = options
    end

    attr_accessor :properties

    def self.extended(component)
      component.properties = {}
    end

    def component(component_name, locals = {}, options = {}, &block)
      captured_block = proc { |args| capture(args, &block) } if block_given?
      Pano::ComponentRenderer.new(
        controller,
        view_flow || (view && view.view_flow),
      ).render(
        component_name,
        locals,
        options,
        &captured_block
      )
    end

    alias :c :component
  end
end