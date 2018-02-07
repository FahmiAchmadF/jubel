# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@showPrev = (element) -> 
  $("#imgPreview").attr('src', element.src)
  $("#exampleModalLabel").text(element.alt)
  $("#exampleModal").modal('show')