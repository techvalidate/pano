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

import application from 'stimulus_application'

import { Controllers, registerControllers } from 'pano-js'
import { DateInput } from 'biome'

delete Controllers['DatePickerController']

customElements.define('date-input', DateInput, { extends: 'input' })

registerControllers(application, Controllers)


require('../guide/index')
