class DarkSky
  attr_reader :id,
              :current_weather,

  def initialize(weather_info, location)
    @daily = weather_info[:daily]
    @hourly = weather_info[:hourly]
    @currently = weather_info[:currently]
    @location = location
    @current_weather = current_weather_hash
  end

  def current_weather_hash
    {
      icon: @currently[:icon],
      summary: @currently[:summary],
      location: @location,
      current_temp: @currently[:temperature],
      current_time: hourly(@currently[:time]),
      today: formatted_date(@currently[:time]),
      high: @daily[:data].first[:temperatureHigh],
      low: @daily[:data].first[:temperatureLow]
    }
  end

end
