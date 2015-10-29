class LocationLegislatorsCreator
  attr_reader :service, :current_user

  def initialize(current_user)
    @current_user = current_user
    @service ||= SunlightService.new
  end

  def create_legislators
    service.state_legislators_by_location(current_user).each do |params|
      legislator = Legislator.find_or_create_by(full_name: params[:full_name],
                                    first_name: params[:first_name],
                                     last_name: params[:last_name],
                                  votesmart_id: params[:votesmart_id].to_s,
                                        leg_id: params[:leg_id],
                           transparencydata_id: params[:transparencydata_id],
                                         level: params[:level],
                                       chamber: params[:chamber],
                                         party: params[:party],
                                         email: params[:email])

      associate_user_with_legislator(legislator)
    end

    service.national_legislators_by_location(current_user).each do |params|

      legislator = Legislator.find_or_create_by(first_name: params[:first_name],
                                     last_name: params[:last_name],
                                  votesmart_id: params[:votesmart_id].to_s,
                                   bioguide_id: params[:bioguide_id],
                                       fec_ids: params[:fec_ids],
                                         level: "national",
                                         phone: params[:phone],
                                       chamber: params[:chamber],
                                         party: params[:party],
                                         email: params[:oc_email])

      associate_user_with_legislator(legislator)
    end
  end

  def associate_user_with_legislator(legislator)
    AddressLegislator.create(address: current_user.address,
                          legislator: legislator)
  end
end
