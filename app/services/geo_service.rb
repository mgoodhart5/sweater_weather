class GeoService
  def initialize(location)
    @location = location
  end

  def lat
    lat_and_lon[:lat]
  end

  def lon
    lat_and_lon[:lng]
  end

  def lat_and_lon
    get_json("maps/api/geocode/json?")
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end

  def conn
    Faraday.new(:url => "https://maps.googleapis.com/") do |faraday|
      faraday.params["key"] = ENV['GOOGLE_API_KEY']
      faraday.params["address"] = @location
      faraday.adapter Faraday.default_adapter
    end
  end

end
