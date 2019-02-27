
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import application from 'stimulus_application'

// customElements.define('date-input', DateInput, { extends: 'input' })
const context = require.context('components/wds/', true, /_controller\.js$/)
console.log(definitionsFromContext(context))
application.load(definitionsFromContext(context))

