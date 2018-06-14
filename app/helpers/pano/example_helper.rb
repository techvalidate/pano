module Pano
  module ExampleHelper

    # Takes a HAML code block wrapped in the :plain prefix and renders it both
    # as HTML and as sample code. Example usage:
    #
    # = haml_example do
    #   :plain
    #     %h1 This is a H1 tag
    #
    def haml_example(&block)
      div_tag class: 'styleguide-example' do

        tabs = div_tag class: 'tabs' do
          safe_join [
            link_to('Example', '.rendered-example', class: 'selected'),
            link_to('Code', '.code-example')
          ]
        end

        body = div_tag class: 'body' do

          # render the passed plain text as HAML
          rendered_code = div_tag class: 'panel rendered-example' do
            Haml::Engine.new(capture(&block)).render(self)
          end

          # Format the plain code text in a pre tag
          plain_code = div_tag class: 'panel code-example hidden' do
            content_tag :pre do
              content_tag :code, block
            end
          end

          rendered_code + plain_code
        end

        tabs + body
      end
    end

  end
end
