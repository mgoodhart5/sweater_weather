class Api::V1::ForecastController < ApplicationController
  def index
    render json: Location.all
  end
end
