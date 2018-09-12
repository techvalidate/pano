module Pano
  module TooltipHelper
    def tooltip(toggle_text, options = {}, &block)
      text = options.delete :text
      options = options.merge({'data-controller': 'tooltip'})

      if block_given?
        content_tag :div, options do
          toggle = p_tag toggle_text, data: {target: 'tooltip.toggle'}
          body = tooltip_template(&block)
          safe_join([toggle, body])
        end
      else
        content_tag :div, toggle_text, options
      end
    end

    def simple_tooltip(text = '', options = {})
      content_tag :div, options.add_class('tooltip tooltip-simple') do
        content_tag :div, text, class: 'tooltip-body'
      end
    end

    def info_tooltip(text = '', options = {}, &block)
      klass = options.delete :class
      options = options.merge({'data-controller': 'tooltip'})
      if block_given?
        span_tag options.add_class("info-tip-toggle #{klass}") do
          ic = icon :info
          template = content_tag :div, capture(&block), {class: 'tooltip-template', data: {target: 'tooltip.template'}}
          safe_join([ic, template])
        end
      else
        span_tag options.merge({title: text, class: "info-tip-toggle #{klass}"}) do
          icon :info
        end
      end
    end

    def info_popover(header, body_text = '', options = {}, &block)
      klass         = options.delete :class
      header_icon   = options.delete :icon
      footer_action = options.delete :action
      width         = options.delete :width

      if block_given?
        body_text = capture(&block)
      end

      data = width.nil? ? {controller: 'popover'} : {controller: 'popover', 'popover-width': width}

      span_tag class: "info-tip-toggle #{klass}", data: data do
        ic = icon :info
        template = render :partial => 'pano/components/popover', locals: {body_text: body_text, header: header, header_icon: header_icon, footer_action: footer_action}

        safe_join([ic, template])
      end
    end

    def tooltip_template(&block)
      content_tag :div, class: 'tooltip-template', data: {target: 'tooltip.template'} do
        capture &block
      end
    end
  end
end