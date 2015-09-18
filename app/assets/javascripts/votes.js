// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

  // $(".disabled").on('click', function(e) {e.preventDefault();});

  $(".disabled.cant-up")  .on('click', function(e) {alert('You have already voted up.'  ); e.preventDefault();});
  $(".disabled.cant-down").on('click', function(e) {alert('You have already voted down.'); e.preventDefault();});
});