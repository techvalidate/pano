module Pano
  module ModalHelper

    def modal(id, options = {}, &block)
      options.add_class 'modal-content'
      title = options[:title]
      icon = options[:icon]
      description = options[:description]

      options[:data] ||= {}
      options[:data][:controller] = options[:data][:controller] || 'modals--base'
      controller = options[:data][:controller]

      if title.nil?
        header = ''
      else
        header = modal_header(title, icon, description)
      end

      div_tag class: 'modal', id: id, data: options[:data] do
        modal = div_tag class: 'modal-dialog' do
          div_tag class: options[:class] do
            close_drawer_icon(controller) + header + capture(controller, &block)
          end
        end
        modal +  div_tag('', class: 'modal-bg', data: { action: "click->#{controller}#close"})
      end
    end

    def modal_header(title, ic = nil, description = nil)
      return '' if title.blank?

      header_icon = ''
      header_description = ''

      unless ic.nil?
        case ic
        when Symbol
          header_icon = icon(ic, class: 'modal-icon')
        when String
          header_icon = ic
        end
      end

      unless description.nil?
        header_description = p_tag class: 'modal-description' do
          description
        end
      end

      modal_title = h2_tag(title, class: 'modal-title') || ''

      content_tag :div, class: 'modal-header' do
        safe_join([header_icon, modal_title, header_description])
      end
    end

    def modal_body(&block)
      content_tag :div, class: 'modal-body' do
        capture(&block)
      end
    end

    def modal_body_text(copy)
      content_tag :div, class: 'modal-body' do
        p_tag copy, class: 'modal-copy'
      end
    end

    def modal_footer_cta(text, url, options = {})
      content_tag :div, class: 'modal-footer' do
        btn_to text, url, class: 'js-modal btn modal-action--cta'
      end
    end

    def modal_footer_actions(actions = {})
      primary_args   = actions.delete :primary
      secondary_args = actions.delete :secondary
      tertiary_args  = actions.delete :tertiary

      btns = []

      if secondary_args
        btns.append action_btn(secondary_args, {class: 'btn-outline'})
      end

      if primary_args
        btns.append action_btn(primary_args)
      end

      if tertiary_args
        btns.append action_btn(tertiary_args, {class: 'fl btn-warning'})
      end

      content_tag :div, class: 'modal-footer' do
         safe_join(btns)
      end
    end

    def modal_footer_form_actions(form, actions = {})
      primary_args   = actions.delete :primary
      secondary_args = actions.delete :secondary

      btns = []

      if secondary_args
        btns.append action_btn(secondary_args, {class: 'btn-outline'})
      end

      if primary_args
        btns.append action_submit_btn(form, primary_args)
      end

      content_tag :div, class: 'modal-footer' do
         safe_join(btns)
      end
    end

    def action_btn(args, options = {})
      text, url, opts = args
      klass = options.delete :class

      btn_to text, (url || js_void), (opts || {}).add_class("modal-action #{klass}")
    end

    def action_submit_btn(*args)
      form, text, opts = args

      form.submit (text || 'Submit'), (opts || {}).add_class('modal-action')
    end

    def close_drawer_icon(controller)
      link_to '', js_void, class: 'close-icon', data: { action: "click->#{controller}#close" }
    end

    def preview_close_btn
      link_to '', js_void, class: 'close-icon'
    end

    def modal_footer_cancel
      content_tag(:div, class: 'modal-footer') do
        link_to 'Cancel', '', class: 'js-close-modal'
      end
    end

    # See also modal_footer_with_cancel in app_form_builder.rb
    def modal_footer_done
      content_tag(:div, class: 'modal-footer') do
        btn_to 'Done', '', class: 'js-close-modal'
      end
    end

    def modal_footer_ok
      content_tag(:div, class: 'modal-footer') do
        btn_to 'OK', '', class: 'js-close-modal'
      end
    end

    def modal_footer_submit(btn_label, options_for_btn = {})
      content_tag(:div, class: 'form-footer modal-footer') do
        safe_join([submit_tag(btn_label, options_for_btn.add_class('btn')), link_to('Cancel', '', class: 'btn btn-cancel js-close-modal')])
      end
    end

  end

end
