UI.click '.scroll-to-self', (e, el) ->
  $('html, body').animate { scrollTop: el.offset().top }, 300

UI.click '.scroll-to-target', (e, el) ->
  target = $(el.data('scroll-target'))
  offset = el.data('scroll-offset') || 0
  $('html, body').animate { scrollTop: target.offset().top - offset }, 300


UI.click '.scroll-to-top', (e, el) ->
  $('html, body').animate { scrollTop: 0 }, 300
