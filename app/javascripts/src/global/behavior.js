$.behavior = function(target, refineSelector) {
  if (refineSelector) {
    $(`[data-behavior~=${target}]:${refineSelector}`);
  } else {
    $(`[data-behavior~=${target}]`);
  }
};

$.fn.disable = function() {
  this.each(function() {
    $(this).addClass('disabled').prop('disabled', true);
  });
};

$.fn.enable = function() {
  this.each(function() {
    $(this).removeClass('disabled').prop('disabled', false);
  });
};

$.fn.exists = function() {
  return this.length > 0;
};

$.fn.isBlank = function() {
  return this.val() === '';
};

$.registerBehavior = function(dataBehavior, event, callback) {
  callback();
  $.behavior(dataBehavior).on(event, () => callback());
};

$.fn.uncheck = function() {
  this.each(function() {
    $(this).prop('checked', false).removeClass('checked');
  }); // the checked class is for ie8
};
