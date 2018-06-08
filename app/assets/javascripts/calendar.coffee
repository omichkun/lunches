# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#ready =->
#  $('#calendar').fullCalendar({});
#$(document).ready(ready)


eventCalendar = ->
  $('#calendar').fullCalendar {events: '/menus.json'}

clearCalendar = ->
  $('#calendar').fullCalendar 'delete'
  # In case delete doesn't work.
  $('#calendar').html ''
  return

$(document).on 'turbolinks:load', eventCalendar
$(document).on 'turbolinks:before-cache', clearCalendar
