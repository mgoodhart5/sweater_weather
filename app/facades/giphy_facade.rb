class GiphyFacade
  
  def initialize(location)
    @location = location
  end

  def geo_call
    @_geo_call ||= GeoService.new(@location)
  end

  def forecast_call
    @_forecast_call ||= DarkSkyService.new(geo_call.lat, geo_call.lon).weather_info[:daily][:data]
  end

  def get_daily_forecast
    forecast_call.map do |day|
      DailyWeather.new(day)
    end
  end

  def giphy_call
    @_giphy_call ||= GiphyService.new(@location)
  end

  def all_giphys
    get_daily_forecast.map do |daily_weather|
      url = giphy_call.find_the_giphys(daily_weather.icon)[0][:url]
      time = daily_weather.day
      summary = daily_weather.summary
      Giphy.new(url, time, summary)
    end
  end
end
