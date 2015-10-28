class Legislator < ActiveRecord::Base
  validates :sha, uniqueness: true

  before_validation :generate_sha

  has_many :addresses, through: :address_legislators
  has_many :address_legislators

  def generate_sha
    self.sha = Digest::SHA1.hexdigest(self.full_name.to_s + self.leg_id.to_s)
  end
end
