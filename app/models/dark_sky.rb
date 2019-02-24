class DarkSky
  attr_reader :id,
              :current_weather,
              :current_weather_details,
              :hourly_weather,
              :daily_weather


  def initialize(weather_info, location)
    @daily = weather_info[:daily]
    @hourly = weather_info[:hourly]
    @currently = weather_info[:currently]
    @location = location
    @current_weather = current_weather_hash
    @current_weather_details = current_weather_details_hash
    @hourly_weather = hourly_weather_hash[0..7]
    @daily_weather = daily_weather_hash
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

  def current_weather_details_hash
    {
      icon: @currently[:icon],
      summary: @currently[:summary],
      real_feel: @currently[:apparentTemperature],
      humidity: @currently[:humidity],
      visibility: @currently[:visibility],
      uv_index: @currently[:uvIndex],
      today_summary: @hourly[:summary],
      tonight_summary: @hourly[:data].last[:summary]
    }
  end

  def hourly_weather_hash
    @hourly[:data].map do |hour|
      {
        icon: hour[:icon],
        time: hourly(hour[:time]),
        temperature: hour[:temperature]
      }
    end
  end

  def daily_weather_hash
    @daily[:data].map do |day|
      {
        icon: day[:icon],
        day: day_name(day[:time]),
        temperature_high: day[:temperatureHigh],
        temperature_low: day[:temperatureLow],
        precip_probabily: day[:precipProbability],
        type: day[:precipType]
      }
    end
  end

  def hourly(data)
    Time.at(data).strftime("%l %P")
  end

  def day_name(data)
    Time.at(data).strftime("%A")
  end

  def formatted_date(data)
    Time.at(data).strftime("%-m/%-d")
  end

end
