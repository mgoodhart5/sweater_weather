class GiphyService

  def initialize(location)
    @location = location
  end

  def find_the_giphys(keyword)
    response = conn.get("/v1/gifs/search?") do |f|
      f.params[:q] = keyword
    end
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def conn
    Faraday.new(:url => "http://api.giphy.com") do |f|
      f.params["api_key"] = ENV['GIPHY_API_KEY']
      f.params["limit"] = 9
      f.adapter Faraday.default_adapter
    end
  end
end
