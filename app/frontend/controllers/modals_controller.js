import 'whatwg-fetch' // fetch polyfill
import { Controller } from 'stimulus'

export default class extends Controller {
  open(e) {
    
    const $target = e.currentTarget
    const modalUri = $target.getAttribute('href') || $target.getAttribute('data-modal')

    e.preventDefault();

    if (modalUri.indexOf('#') === 0) {
      const modalParent = this.element.querySelector(modalUri)
      const overlay = modalParent.querySelector('.wds-overlay')
      const modal = modalParent.querySelector('.wds-modal')
      
      this.show(modal, overlay, modalParent)
    } else {
      this.getModal(modalUri)
    }
  }

  show(modal, overlay, parent) {
    parent.classList.add('pano-modal--active')
    
    modal.classList.add('wds-modal--active')
    overlay.classList.add('wds-modal--active')
    setTimeout(function() {
      overlay.classList.add('wds-fade--enter-active')
      modal.classList.add('wds-slide--enter-active')
    }, 10)
    
  }

  close() {
    let removeTimeout
    const modals = document.querySelectorAll('.wds-modal--active')
    modals.forEach((layer) => {
      if (layer.classList.contains('wds-overlay')) {
        layer.classList.add('wds-fade--exit')
        layer.classList.add('wds-fade--exit-active')
      }

      if (layer.classList.contains('wds-modal')) {
        layer.classList.add('wds-slide--exit')
        layer.classList.add('wds-slide--exit-active')
      }
      
      setTimeout(function() {
        layer.classList.remove('wds-modal--active')
      }, 600)
    })
  }

  getModal(url) {
    const controller = this
    fetch(url, {
      credentials: 'same-origin',
      redirect: 'follow'
    })
      .then((response) => {

        if(response.ok) return response.text()

        if (response.status === 404) throw new Error('Sorry, the requested item could not be found.')

        throw new Error('Sorry, an error occurred in processing your request. Please contact support if the error persists.')
      }).then((html) => {
        const $htmlResponse = $(html)
        const id = $htmlResponse.attr('id')

        $htmlResponse.addClass('js-ajax-modal')
        $('body').append($htmlResponse)

        controller.show($(`#${id}`))
        $('body').css('overflow', 'hidden');
      }).catch((err) => {
        alert(err.message)
      })
  }
}