class Address < ActiveRecord::Base
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true,
            length: {is: 2},
            format: {with: /[A-Z]/, message: "Please use two capital letters"}
  validates :zip_code, presence: true,
                       length: {is: 5}
  validates :sha, uniqueness: true

  before_validation :generate_sha

  belongs_to :user

  has_many :legislators, through: :address_legislators
  has_many :address_legislators, dependent: :destroy

  def convert_to_lat_long_for_user
    if self.user
      lat_long = Geocoder.coordinates(self.street + ", " +
                                      self.city + ", " +
                                      self.state + ", " +
                                      self.zip_code)
      self.user.update_attributes(latitude: lat_long[0], longitude: lat_long[1])
    end
  end

  def generate_sha
    self.sha = Digest::SHA1.hexdigest(self.street.to_s + self.zip_code.to_s)
  end
end
