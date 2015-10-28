class SunlightService
  attr_reader :connection

  def initialize
    @connection ||= Hurley::Client.new("http://openstates.org/api/v1/")
    connection.query[:apikey] = ENV["SUNLIGHT_API_KEY"]
  end

  def state_legislators_by_location(current_user)
    @test = parse(connection.get("legislators/geo/?lat=#{current_user.latitude.to_s}&long=#{current_user.longitude.to_s}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
