import 'components/index'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import application from 'stimulus_application'

// customElements.define('date-input', DateInput, { extends: 'input' })
const wdsContext = require.context('components/wds/', true, /_controller\.js$/)
const controllerContext = require.context('controllers', true, /_controller\.js$/)

application.load(definitionsFromContext(wdsContext))
application.load(definitionsFromContext(controllerContext))

var componentRequireContext = require.context("components/react/", true)
var ReactRailsUJS = require("react_ujs")
ReactRailsUJS.useContext(componentRequireContext)

