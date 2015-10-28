class LocationLegislatorsCreator
  attr_reader :service, :current_user

  def initialize(current_user)
    @current_user = current_user
    @service ||= SunlightService.new
  end

  def create_state_legislators
    service.state_legislators_by_location(current_user).each do |params|
      legislator = Legislator.find_or_create_by(full_name: params[:full_name],
                                    first_name: params[:first_name],
                                     last_name: params[:last_name],
                                        leg_id: params[:first_name],
                           transparencydata_id: params[:transparencydata_id],
                                         level: params[:level],
                                       chamber: params[:chamber],
                                         party: params[:party],
                                         email: params[:email])

      associate_user_with_legislator(legislator)
    end
  end

  def associate_user_with_legislator(legislator)
    AddressLegislator.create(address: current_user.address,
                          legislator: legislator)
  end
end
