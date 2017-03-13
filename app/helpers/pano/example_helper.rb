module Pano
  module ExampleHelper
    def haml_example(rendered_classes, code_classes, &block)
      # Re-render the plain code text
      rendered = div_tag class: ['panel', *rendered_classes] do
        text = capture(&block)
        Haml::Engine.new(text).render
      end
      # Format the plain code text
      code = div_tag class: ['panel', *code_classes] { content_tag :pre, &block }
      div_tag do
        concat rendered
        concat code
      end
    end
  end
end
