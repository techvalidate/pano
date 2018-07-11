module Pano
  module CardHelper

    def card(title = '', options = {}, &block)

      if title.empty?
        header = ''
      else
        header_opts = {}
        header_opts[:header_action] = options.delete :header_action
        header = card_header(title, header_opts)
      end

      content = capture(&block)

      content_tag :div, options.add_class('card') do
        safe_join([header, content])
      end
    end

    def small_card(title, options = {}, &block)
      header = card_header(title, options)

      content = capture(&block)

      content_tag :div, class: 'card card-small' do
        header + content
      end
    end
    def subtitle_card(title, options = {}, &block)
      options[:small_title] = true

      header = card_header(title, options)

      content = capture(&block)

      content_tag :div, class: 'card' do
        header + content
      end
    end

    def skinny_card(title = '', options = {}, &block)
      header_action = options.delete :header_action
      if title.empty?
        header = ''
      else
        header = card_header(title, header_action: header_action)
      end

      content = capture(&block)

      content_tag :div, options.add_class('card card-divided') do
        safe_join([header, content])
      end
    end

    def divided_card(*args, &block)
      title, opts = args
      opts = opts || {}

      opts.add_class ' card-divided'

      card(title, opts, &block)
    end

    def card_header(title, options = {})
      action      = options.delete :header_action
      icon_name   = options.delete :icon
      small_title = options.delete  :small_title || false

      if small_title
        title = h4_tag title, class: 'card-title-small'
      else
        title = h3_tag title, class: 'card-title'
      end

      ic = ''
      unless icon_name.nil?
        ic = icon(icon_name, {class: 'card-icon'})
      end

      tertiary_action = ''
      unless action.nil?
        tertiary_action = content_tag :span, class: 'card-header-action' do
          action
        end
      end

      content_tag :div, options.add_class('card-header') do
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