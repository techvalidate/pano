module Pano
  module TooltipHelper
    def simple_tooltip(text = '', options = {})
      content_tag :div, options.add_class('tooltip tooltip-simple') do
        content_tag :div, text, class: 'tooltip-body'
      end
    end

    def info_tooltip(text = '', options = {}, &block)
      klass = options.delete :class
<<<<<<< HEAD
      if block_given?
=======
      if text.blank?
>>>>>>> c3a6aaa31324bf9a2dae0196cf7d69320e6b6bd9
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
        template = render :partial => 'pano/components/popover', locals: {body_text: body_text, header: header, header_icon: header_icon, footer_action: footer_action}

        safe_join([ic, template])
      end
    end
  end
end