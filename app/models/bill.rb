class Bill < OpenStruct
  def self.service
    @service ||= SunlightService.new
  end

  def self.where(params)
    if params[:leg_id]
      service.state_bills(params[:leg_id]).map {|bill| Bill.new(bill)}
    else
      service.national_bills(params[:bioguide_id]).map {|bill| Bill.new(bill)}
    end
  end

  def extant_title
    short_title || official_title
  end

  def link
    if urls
      urls[:opencongress]
    end
  end
end
