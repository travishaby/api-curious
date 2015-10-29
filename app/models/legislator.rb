class Legislator < ActiveRecord::Base
  validates :sha, uniqueness: true

  before_validation :generate_sha

  has_many :addresses, through: :address_legislators
  has_many :address_legislators

  def generate_sha
    self.sha = Digest::SHA1.hexdigest(self.first_name.to_s + self.votesmart_id.to_s)
  end

  def combined_name
    first_name + " " + last_name
  end
end
