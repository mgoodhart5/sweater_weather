class Api::V1::GifsController < ApplicationController
  def index
    gifs = GiphyFacade.new(params[:location])
    render json: GiphySerializer.new(gifs.all_giphys)
  end
end
