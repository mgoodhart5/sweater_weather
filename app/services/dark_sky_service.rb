class DarkSkyService
  attr_reader :lat, :lon

  def initialize(location)
    @location = location
    @lat = geo_call.lat
    @lon = geo_call.lon
  end

  def weather_info
    Rails.cache.fetch("lat#{@lat}_and_lon#{@lon}", expires_in: 1.year) do
      key = "#{ENV['DARKSKY_API_KEY']}"
      get_json("/forecast/#{key}/#{@lat},#{@lon}")
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end


  def conn
    Faraday.new(:url => "https://api.darksky.net") do |f|
      f.params["exclude"] = "minutely"
      f.params["exclude"] = "flags"
      f.params["exclude"] = "offset"
      f.adapter Faraday.default_adapter
    end
  end

  def geo_call
    @_geo_call ||= GeoService.new(@location)
  end
end
