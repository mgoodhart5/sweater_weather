class WeatherFacade

  def initialize(location)
    @location = location
  end

  def forecast
    @_forecast ||= Weather.new(response, @location)
  end

  def dark_sky_call
    @_dark_sky_call ||= DarkSkyService.new(@location)
  end

  def response
    dark_sky_call.weather_info
  end

end
