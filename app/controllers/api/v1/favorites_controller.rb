class Api::V1::FavoritesController < ApplicationController
  def create
    if params[:api_key]
      user = User.find_by(api_key: params[:api_key])
      user.favorites.create(location: params[:location])
    else
      render json: "Get a damn api key.", status: :unauthorized
    end
  end

  def index
    if params[:api_key]
      user = User.find_by(api_key: params[:api_key])
      favs = user.favorites.current_weather
      render json: FavoritesSerializer.new(favs)
    else
      render json: "Get a damn api key.", status: :unauthorized
    end
  end
end
