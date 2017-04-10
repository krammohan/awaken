(function($) {

  $(function() {

    var $window = $(window),
    $target = $('.homepage');

    // Disable animations/transitions until the page has loaded.
    $target.addClass('is-loading');

    $window.on('load', function() {
      $target.removeClass('is-loading');
    });

  });

})(jQuery);