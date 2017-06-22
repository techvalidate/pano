#= require switchery

# =====================================================
# iOS-style checkbox switches (via http://abpetkov.github.io/switchery/)
# =====================================================

settings = {
  color: '#23D385',
}

UI.load ->
  # elem = document.querySelector('.js-switch')
  # new Switchery(elem, settings)
  switches = $('.js-switch')
  switches.each(->
    new Switchery(this, settings)
  )
