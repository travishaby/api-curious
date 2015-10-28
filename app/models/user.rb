class User < ActiveRecord::Base
  validates :name, presence: true
  validates :screen_name, uniqueness: true
  has_one :address, dependent: :destroy
  delegate :legislators, to: :address

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.screen_name        = auth_info.extra.raw_info.screen_name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  def state_legislators
    legislators.where(level: "state")
  end

  def state_representatives
    legislators.where(level: "state", chamber: "lower")
  end

  def state_senators
    legislators.where(level: "state", chamber: "upper")
  end
end
