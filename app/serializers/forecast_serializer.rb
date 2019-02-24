class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_weather,
             :current_weather_details,
             :hourly_weather,
             :daily_weather

end
