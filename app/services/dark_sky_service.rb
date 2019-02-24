class DarkSkyService
  attr_reader :lat, :lon

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def weather_info
    key = "#{ENV['DARKSKY_API_KEY']}"
    get_json("/forecast/#{key}/#{@lat},#{@lon}")
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
end
