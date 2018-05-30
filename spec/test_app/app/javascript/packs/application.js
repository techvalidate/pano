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
import { Controllers, registerControllers } from 'pano-js'

const application = Application.start()
const context = require.context('../guide/controllers', true, /\.js$/)

application.load(definitionsFromContext(context))

registerControllers(application, Controllers)

require('../guide/index')
