App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    $(".waing_user").append("<p>Waiting for matching user...</p>")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    switch data.action
      when "chat_start"
        $('.waing_user').hide()
        $('.user_info').text("Chat started! #{data.msg}.")
        $('#chat_board').show()
      when "chat_ending"
      	$('.user_info').text("User quit and Chat is end !!")
        #@printMessage("User quit and Chat is end !!")
      else
        $('#messages').append(data['message'])
  
  speak: (message,user_name) ->
    @perform 'speak' , (message: message , user_name: user_name)

  #printMessage: (message) ->
    #$("#info").append("<p>#{message}</p>")
    
  $(document).on 'keypress' , '[data-action=speaking]' , (event) ->
    if event.keyCode == 13
      App.chat.speak(event.target.value,$('#user_name').data('user-name'))
      event.target.value= ''
      event.preventDefault()   


  