# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@showPrev = (event, element) ->
  event.preventDefault()
  $("#imgPreview").attr('src', element.href)
  $("#exampleModalLabel").text(element.title)
  $("#exampleModal").modal('show')
