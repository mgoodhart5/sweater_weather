class WeatherFacade

  def initialize(location)
    @location = location
  end

  def forecast
    gs = GeoService.new(@location)
    dss = DarkSkyService.new(gs.lat, gs.lon)
    response = dss.weather_info
    Weather.new(response, @location)
  end
end
