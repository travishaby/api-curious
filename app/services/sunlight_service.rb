class SunlightService
  attr_reader :state_connection, :national_connection, :funding_connection

  def initialize
    @state_connection ||= Hurley::Client.new("http://openstates.org/api/v1/")
    @national_connection ||= Hurley::Client.new("http://congress.api.sunlightfoundation.com/")
    @funding_connection ||= Hurley::Client.new("http://realtime.influenceexplorer.com/api/")
    set_connection_api_keys
  end

  def state_legislators_by_location(current_user)
    parse(state_connection.get("legislators/geo/?lat=#{current_user.latitude.to_s}&long=#{current_user.longitude.to_s}"))
  end

  def national_legislators_by_location(current_user)
    parse(national_connection.get("legislators/locate?latitude=#{current_user.latitude.to_s}&longitude=#{current_user.longitude.to_s}"))[:results]
  end

  def state_bills(leg_id)
    parse(state_connection.get("bills?sponsor_id=#{leg_id}"))
  end

  def national_bills(bioguide_id)
    parse(national_connection.get("bills?sponsor_id=#{bioguide_id}"))[:results]
  end

  def national_congressperson_funding(fec_ids)
    fec_ids.flat_map do |id|
      parse(funding_connection.get("candidates/?format=json&page=1&page_size=10&fec_id=#{id}"))[:results]
    end
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def set_connection_api_keys
    connections = [@state_connection, @national_connection, @funding_connection]
    connections.each {|conn| conn.query[:apikey] = ENV["SUNLIGHT_API_KEY"]}
  end
end
