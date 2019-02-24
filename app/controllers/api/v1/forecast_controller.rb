class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastSerializer.new(Location.all)
  end
end
