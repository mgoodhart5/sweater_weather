class GiphyService
  attr_reader :id,
              :time,
              :summary,
              :url

  def initialize(location)
    @location = location
  end

  def conn
    Faraday.new(:url => "http://api.giphy.com") do |f|
      f.params["api_key"] = ENV['GIPHY_API_KEY']
      f.params["q"] = "sunny"
      f.adapter Faraday.default_adapter
    end

    response = conn.get("/v1/gifs/search?")
    JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
