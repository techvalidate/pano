import $ from 'jquery'
import { UI } from 'pano-js'

/**
 * Example code tabs
 */
UI.click('.styleguide-example .tabs a', (e, el) => {
  e.preventDefault()
  const target = el.attr('href')
  const container = el.parent().parent()
  container.find('.panel').addClass('hidden')
  container.find(target).removeClass('hidden')
  container.find('.tabs a').removeClass('selected')
  el.addClass('selected')
})