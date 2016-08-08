class Room < ApplicationRecord
  def self.start(uuid1, uuid2)
    ActionCable.server.broadcast "user_#{uuid1}", {action: "chat_start", msg: "uuid2 in !!!"}
    ActionCable.server.broadcast "user_#{uuid2}", {action: "chat_start", msg: "uuid1 in !!!"}
    REDIS.set("opponent_for:#{uuid1}", uuid2)
    REDIS.set("opponent_for:#{uuid2}", uuid1)
  end

  def self.chat_end(uuid)
    if another_user = opponent_for(uuid)
      ActionCable.server.broadcast "user_#{another_user}", {action: "chat_ending"}
    end
  end

  def self.opponent_for(uuid)
    REDIS.get("opponent_for:#{uuid}")
  end
end
