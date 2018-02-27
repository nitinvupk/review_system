// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(document).on('turbolinks:load', function() {
  var $star_rating = $('.rate1');
  var SetRatingStar = function() {
    return $star_rating.each(function() {
      if (parseInt($('#rating_point').val()) >= parseInt($(this).data('rating'))) {
        return $(this).removeClass('btn-default').addClass('btn-warning');
      } else {
        return $(this).removeClass('btn-warning').addClass('btn-default');
      }
    });
  };
  $star_rating.on('click', function() {
    $('#rating_point').val($(this).data('rating'));
    return SetRatingStar();
  });
  SetRatingStar();

  function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
  }
  function showPosition(position) {
    $('#user_latitude').val(position.coords.latitude);
    $('#user_longitude').val(position.coords.longitude);
  }
  getLocation()
});

