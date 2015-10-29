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

  def bills
    if leg_id
      Bill.where(leg_id: leg_id)
    else
      Bill.where(bioguide_id: bioguide_id)
    end
  end

  def total_contributions
    if fec_ids
      Funding.total_contributions(parsed_fec_ids)
    end
  end

  def cash_on_hand
    if fec_ids
      Funding.cash_on_hand(parsed_fec_ids)
    end
  end

  def parsed_fec_ids
    eval(fec_ids)
  end
end
 
