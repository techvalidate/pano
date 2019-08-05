last = require('lodash-es/last').default

UI.click '[show-calendar-modal]', (e, el) ->
  e.preventDefault()
  e.stopPropagation()
  href = el.attr('href')

  if href.indexOf('#') == 0
    data = $(el).data()

    Modals.show $(href), data
    bindCalendars($('#rangestart'), $('#rangeend'), data)


bindCalendars = (rangeStart, rangeEnd, data) ->
  startCalEl = '.rangestart-value .value'
  startCalInput = '#hidden_start_on'
  endCalEl = '.rangeend-value .value'
  endCalInput = '#hidden_finish_on'
  startDate = data['startOn']
  finishDate = data['finishOn']

  setDateValue = (el, input, date) ->
    formattedDate= rome.moment(date).format('MMM D, YYYY')
    $(el).text(formattedDate)
    if input
      $(input).val(date)

  startCal = rome(rangeStart[0], {
    dateValidator: rome.val.beforeEq(rangeEnd[0])
    initialValue: startDate
    time: false
  })
  .on('data', (value) ->
    setDateValue(startCalEl, startCalInput, value)
  )

  endCal = rome(rangeEnd[0], {
    dateValidator: rome.val.afterEq(rangeStart[0])
    time: false
    initialValue: finishDate
  }).on('data', (value) ->
    setDateValue(endCalEl, endCalInput, value)
  )

  $('.custom_range_form')
  .on('ajax:complete', -> Modals.close(last(Modals.currentModals)))
  .on('ajax:error', ->
    Modals.close(last(Modals.currentModals))
    alert("Sorry, an error occurred in processing your request. Please contact support if the error persists.")
  )

  startCal.refresh()
  endCal.refresh()
  setDateValue(startCalEl, null, startCal.getDate())
  setDateValue(endCalEl, null, endCal.getDate())
