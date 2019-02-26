class GiphyService

  def initialize(location)
    @location = location
  end

  def geo_call
    @_geo_call ||= GeoService.new(@location)
  end

  def forecast_call
    DarkSkyService.new(geo_call.lat, geo_call.lon)
  end

  def giphy_info
    forecast_call.weather_info[:daily][:data][0..7].map do |info|
      get_json("/v1/gifs/search?#{info[:icon]}")
    end.flatten
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def conn
    Faraday.new(:url => "http://api.giphy.com") do |f|
      f.params["api_key"] = ENV['GIPHY_API_KEY']
      f.params["q"] = "sunny"
      f.params["limit"] = 9
      f.adapter Faraday.default_adapter
    end
  end
end
