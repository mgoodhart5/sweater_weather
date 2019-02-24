class FlickrService
  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def photo_info
    get_json("/services/rest/?method=flickr.photos.search&tags=skyline%2Cscenic%2Cphotography%2Coutdoors&safe_search=1&lat=#{@lat}&lon=#{@lon}&per_page=25&format=json&nojsoncallback=1&sort=relevance")
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:photos][:photo]
  end

  def conn
    Faraday.new(:url => "https://api.flickr.com") do |f|
      f.params["api_key"] = ENV['FLICKR_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
