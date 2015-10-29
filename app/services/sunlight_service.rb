class SunlightService
  attr_reader :state_connection, :national_connection

  def initialize
    @state_connection ||= Hurley::Client.new("http://openstates.org/api/v1/")
    @national_connection ||= Hurley::Client.new("http://congress.api.sunlightfoundation.com/")

    state_connection.query[:apikey] = ENV["SUNLIGHT_API_KEY"]
    national_connection.query[:apikey] = ENV["SUNLIGHT_API_KEY"]
  end

  def state_legislators_by_location(current_user)
    parse(state_connection.get("legislators/geo/?lat=#{current_user.latitude.to_s}&long=#{current_user.longitude.to_s}"))
  end

  def national_legislators_by_location(current_user)
    parse(national_connection.get("legislators/locate?latitude=#{current_user.latitude.to_s}&longitude=#{current_user.longitude.to_s}"))[:results]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
