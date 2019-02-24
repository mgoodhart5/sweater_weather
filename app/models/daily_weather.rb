class DailyWeather
  attr_reader :icon,
              :day,
              :temperature_high,
              :temperature_low,
              :precip_probability,
              :precip_type

  def initialize(attributes)
    @icon = attributes[:icon]
    @day = day_name(attributes[:time])
    @temperature_high = attributes[:temperatureHigh]
    @temperature_low = attributes[:temperatureLow]
    @precip_probability = attributes[:precipProbability]
    @precip_type = attributes[:precipType]
  end

  def day_name(data)
    Time.at(data).strftime("%A")
  end
end
