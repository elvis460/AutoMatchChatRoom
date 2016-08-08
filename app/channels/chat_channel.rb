# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_#{uuid}"
    Match.create(uuid)
  end

  def unsubscribed
    Match.remove(uuid)
    Room.chat_end(uuid)
  end

  def speak(data)
    Message.create! content: data['message'] ,user_id: uuid, user_name: data['user_name']
  end
end
