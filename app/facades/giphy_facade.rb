class GiphyFacade

  def initialize(location)
    @location = location
  end

  def geo_call
    @_geo_call ||= GeoService.new(@location)
  end

  def forecast_call
    DarkSkyService.new(geo_call.lat, geo_call.lon)
  end

  def giphy_call
    GiphyService.new(@location)
  end

  def all_giphys
    giphy_call.giphy_info.flatten.map do |g_info|
      forecast_call.weather_info[:daily][:data][0..7].map do |weather_info|
        Giphy.new(g_info[:images][:fixed_width][:url], weather_info[:time], weather_info[:summary])
      end
    end.first
    #this is gross and I am aware of how ridiculous it is.
  end
end
