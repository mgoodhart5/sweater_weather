class DailyWeather
  attr_reader :icon,
              :day,
              :temperature_high,
              :temperature_low,
              :precip_probability,
              :precip_type,
              :summary

  def initialize(attributes)
    @icon = attributes[:icon]
    @day = attributes[:time]
    @temperature_high = attributes[:temperatureHigh]
    @temperature_low = attributes[:temperatureLow]
    @precip_probability = attributes[:precipProbability]
    @precip_type = attributes[:precipType]
    @summary = attributes[:summary]
  end

  def day_name(data)
    Time.at(data).strftime("%A")
  end
end
