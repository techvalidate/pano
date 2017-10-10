module Pano
  module ModalHelper

    def modal(id, title = nil, options = {}, &block)
      options[:class] = [options[:class], 'modal-content'].join(' ')
      icon = options[:icon]
      description = options[:description]
      # If assigns is undefined we're outside of rails controller (e.g. in asset pipeline or pdf rendering context)
      # s_capture won't work in that case, so fall back to capture
      inner_content = capture(&block)

      if title.nil?
        header = ''
      else
        header = modal_header(title, icon, description)
      end

      div_tag class: 'modal', id: id do
        modal = div_tag class: 'modal-dialog' do
          div_tag options do
            close_modal_icon + header + inner_content
          end
        end
        modal_bg = div_tag class: 'modal-bg' do
        end
        modal + modal_bg
      end
    end

    def close_modal_icon
      s "<a class='close-icon js-close-modal'></a>"
    end

    def modal_header(title, icon = nil, description = nil)
      header_icon = ''
      header_description = ''
      unless icon.nil?
        header_icon =  content_tag(:p, class:'gray') do
          large_icon(icon)
        end
      end
      unless description.nil?
        header_description = p_tag class: 'intro' do
          description
        end
      end

      modal_title = h2_tag(title) || ''

      content_tag :div, class: 'modal-header' do
        safe_join([header_icon, modal_title, header_description])
      end
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
