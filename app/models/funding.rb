class Funding < OpenStruct
  def self.service
    @service ||= SunlightService.new
  end

  def self.total_contributions(fec_ids)
    specific_funding_data(fec_ids, :total_contributions)
  end

  def self.cash_on_hand(fec_ids)
    specific_funding_data(fec_ids, :cash_on_hand)
  end

  private

  def self.all_funding_data(fec_ids)
    service.national_congressperson_funding(fec_ids)
  end

  def self.specific_funding_data(fec_ids, key)
    all_funding_data(fec_ids).reduce(0) {|sum, data| sum + data[key].to_f }.to_s
  end
end
