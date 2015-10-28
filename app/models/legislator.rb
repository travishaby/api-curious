class Legislator < ActiveRecord::Base
  has_many :addresses, through: :address_legislators
  has_many :address_legislators

  #need to sanitize name before validation? Beth has \ escape chars in her name
end
