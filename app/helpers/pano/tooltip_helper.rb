module Pano
  module TooltipHelper

    def info_tooltip(text = '', options = {}, &block)
      klass = options.delete :class
      if text.empty?
        span_tag class: "info-tip-toggle #{klass}", data: {controller: 'tooltip'} do
          ic = icon :info
          template = content_tag :div, capture(&block), {class: 'tooltip-template', data: {target: 'tooltip.template'}}
          safe_join([ic, template])
        end
      else
        span_tag title: text, class: "info-tip-toggle #{klass}", data: {controller: 'tooltip'} do
          icon :info
        end
      end
    end

    def info_popover(header, body_text, options = {})
      klass         = options.delete :class
      header_icon   = options.delete :icon
      footer_action = options.delete :action

      span_tag class: "info-tip-toggle #{klass}", data: {controller: 'popover'} do
        ic = icon :info
        template = render :partial => 'pano/ui/popover_template', locals: {body_text: body_text, header: header, header_icon: header_icon, footer_action: footer_action}

        safe_join([ic, template])
      end
    end
  end
end