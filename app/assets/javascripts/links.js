// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('[data-toggle="tooltip"]').tooltip()
  $("#link_output").click().select()
});

$(document).on('click', '.icon', function() {
  $("#link_output").click().select()
  document.execCommand("copy")
  $(this).tooltip('hide').attr('data-original-title', 'Copied!').tooltip('show')
});
