module Pano
  module CardHelper
    def card(title = '', options = {}, &block)
      if title.nil?
        header = ''
      else
        header = card_header(title, options)
      end

      content = content_tag(:div, class: 'card-content') do
        capture(&block)
      end

      content_tag :div, class: 'card' do
        header + content
      end
    end

    def card_header(title, options = {})
      action      = options.delete :tertiary_action
      icon_name   = options.delete :icon
      small_title = options.delete  :small_title || false

      if small_title
        title = h4_tag title, class: 'card-title--small'
      else
        title = h3_tag title, class: 'card-title'
      end

      ic = ''
      unless icon_name.nil?
        ic = icon(icon_name, {class: 'card-icon'})
      end

      tertiary_action = ''
      unless action.nil?
        tertiary_action = content_tag :span, class: 'card-tertiary-action' do
          action
        end
      end

      content_tag :div, class: 'card-header' do
        safe_join([ic, title, tertiary_action])
      end
    end

    def card_footer_with_action(action)
      content_tag :div, class: 'card-footer' do
        action_link action
     end
    end
    def card_footer_with_actions(actions = {})
      primary_args   = actions.delete :primary
      secondary_args = actions.delete :secondary

      btns = []

      if secondary_args
        btns.append action_btn(secondary_args, {class: 'btn-outline'})
      end

      if primary_args
        btns.append action_btn(primary_args)
      end

      content_tag :div, class: 'card-footer' do
         safe_join(btns)
      end
    end


  end
end