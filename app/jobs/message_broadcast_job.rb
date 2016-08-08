class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    if another_user_id = Room.opponent_for(message.user_id)
      ActionCable.server.broadcast "user_#{message.user_id}" , message: render_message(message)
      ActionCable.server.broadcast "user_#{another_user_id}" , message: render_message(message)
    end
  end

  private 
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message' , locals: {message: message})
    end
end
