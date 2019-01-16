import 'components/'
import { DateInput } from 'biome'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import application from 'stimulus_application'

// customElements.define('date-input', DateInput, { extends: 'input' })
const context = require.context('components/datepicker', false, /_controller\.js$/)

application.load(definitionsFromContext(context))

