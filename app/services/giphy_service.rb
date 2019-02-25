class GiphyService

  def initialize(location)
    @location = location
  end

  def giphy_info
    get_json("/v1/gifs/search?")
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def conn
    Faraday.new(:url => "http://api.giphy.com") do |f|
      f.params["api_key"] = ENV['GIPHY_API_KEY']
      f.params["q"] = "sunny"
      f.adapter Faraday.default_adapter
    end
  end
end
