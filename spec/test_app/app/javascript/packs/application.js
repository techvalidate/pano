/* eslint no-console:0 */

// Stimulus polyfills
import 'core-js/fn/object/assign'
import 'core-js/fn/set'
import 'core-js/fn/map'
import 'core-js/fn/promise'
import 'core-js/fn/array/find'
import 'core-js/fn/array/from'
import 'core-js/fn/symbol' // polyfill for dropzone source
import 'element-closest'

import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import { Controllers } from 'pano-js'
const application = Application.start()
const context = require.context('../guide/controllers', true, /\.js$/)
application.load(definitionsFromContext(context))
registerControllers(Controllers)

function registerControllers(controllers) {
  for (let key in controllers) {
    const controller = controllers[key]
    if (typeof controller === 'function') {
      const name = key.match(/^([A-Z])([a-z]+)/)[0].toLowerCase()

      application.register(name, controller)
    } else if (typeof controller === 'object') {
      registerControllers(controller)
    }
  }
}


require('../guide/index')
