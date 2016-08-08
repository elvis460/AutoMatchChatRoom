class Match < ApplicationRecord
  def self.create(uuid)
    if match_user = REDIS.spop("seeks")
      Room.start(uuid, match_user)
    else
      REDIS.sadd("seeks", uuid)
    end
  end

  def self.remove(uuid)
    REDIS.srem("seeks", uuid)
  end

  def self.clear_all
    REDIS.del("seeks")
  end
end
