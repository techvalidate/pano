import { Controller } from 'stimulus'

export default class extends Controller {
  connect() {
    this.disabled = $(this.element).find('.form-group--disabled')
    this.disabled.each((i, el) => {
      $(el).find('input, select').attr('disabled', true)
    })
  }
}