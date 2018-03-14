import { load as onLoad } from '../global/ui'

const settings = {
  color: '#23D385',
};

load(function() {
  // elem = document.querySelector('.js-switch')
  // new Switchery(elem, settings)
  const switches = $('.js-switch');
  switches.each(function() {
    new Switchery(this, settings);
  });
});
