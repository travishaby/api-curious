class AddressLegislator < ActiveRecord::Base
  belongs_to :address
  belongs_to :legislator
end
