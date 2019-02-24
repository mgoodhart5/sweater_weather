class Api::V1::ForecastController < ApplicationController
  def index
    weather = WeatherFacade.new(params["location"])
    render json: ForecastSerializer.new(weather.forecast)
  end
end
