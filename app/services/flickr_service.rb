class FlickrService
  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def photo_info
    get_json("/services/rest/?method=flickr.photos.search&tags=skyline%2Cscenic%2Cphotography&safe_search=1&lat=#{@lat}&lon=#{@lon}&per_page=5&sort=date-taken-desc&format=json&nojsoncallback=1")
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

  def photo_url
    "https://farm#{pic_hash[0][:farm]}.staticflickr.com/#{pic_hash[0][:server]}/#{pic_hash[0][:id]}_#{pic_hash[0][:secret]}_b.jpg"
  end

  def pic_hash
    #shuffle this so that it is a different picture
    photo_info
  end
end
