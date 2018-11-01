# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $('[data-toggle="tooltip"]').tooltip()
    $("#link_output").click().select()

$(document).on 'click', '.icon', ->
    $("#link_output").click().select()
    document.execCommand("copy")
    $(this).tooltip('hide').attr('data-original-title', 'Copied!').tooltip('show')
