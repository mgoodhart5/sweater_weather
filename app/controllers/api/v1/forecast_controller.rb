class Api::V1::ForecastController < ApplicationController
  def index
    location = "Denver, CO"
    gs = GeoService.new(location)
    dss = DarkSkyService.new(gs.lat, gs.lon)
    response = dss.weather_info
    obj = DarkSky.new(response, location)

    render json: ForecastSerializer.new(obj)
  end
end
