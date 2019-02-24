class WeatherFacade

  def initialize(location)
    @location = location
  end

  def forecast
    @_forecast ||= Weather.new(response, @location)
  end

  def geo_call
    @_geo_call ||= GeoService.new(@location)
  end

  def dark_sky_call
    @_dark_sky_call ||= DarkSkyService.new(geo_call.lat, geo_call.lon)
  end

  def response
    dark_sky_call.weather_info
  end

end
