module Pano
  module AccordianHelper

    # Returns accordian component
    #
    #   = accordian do |a|
    #     a.item 'Item Label', open: true do
    #       %p Item Content
    #   # =>  <ul class="accordian" data-controller="accordian">
    #   #       <li class="item item-open">
    #   #         <div class="item-label" data-action="click->accordian#toggle">
    #   #           Item Label
    #   #         </div>
    #   #         <div class="item-content">
    #   #           <p>Item Content</p>
    #   #         </div>
    #   #       <li>
    #
    # To easily pass an html label use +accordian_item_label+ helper
    #
    #   label = accordian_item_label do
    #     %h3 Item Label
    #   # => <div class="item-label"><h3>Item Label</h3></div>
    def accordian(&block)
      builder = AccordianBuilder.new(self)
      content_tag :ul, class: 'accordian', data: {controller: 'accordian'} do
        capture(builder, &Proc.new)
      end
    end

    def accordian_item_label(&block)
      capture(&block)
    end

    class AccordianBuilder
      def initialize(template)
        @template = template
      end

      def item(label = '', open: false, &block)
        open_class = open ? 'item-open' : ''
        title = item_label label
        body = item_body do
          yield
        end

        @template.content_tag :li, class: "item #{open_class}" do
          title + body
        end
      end

      private

      def item_label(text = '')
        @template.content_tag :div, text, class: 'item-label', data: {action: 'click->accordian#toggle'}
      end

      def item_body(&block)
        @template.content_tag :div, class: 'item-content' do
          block.call
        end
      end
    end
  end
end