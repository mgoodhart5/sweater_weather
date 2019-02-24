class HourlyWeather
  attr_reader :icon,
              :time,
              :temperature
              
  def initialize(attributes)
    @icon = attributes[:icon]
    @time = Time.at(attributes[:time]).strftime("%l %P")
    @temperature = attributes[:temperature]
  end
end
