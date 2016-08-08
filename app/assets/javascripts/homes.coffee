# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'keypress' , '#user_name' , (event) ->
  if event.keyCode == 13
    $('.link_path').show()
    $('.linlk').attr("href", "http://localhost:3000/index?user_name="+event.target.value)
    App.chat.speak(event.target.value)
    event.target.value= ''
    event.preventDefault()  