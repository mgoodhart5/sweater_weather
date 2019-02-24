class BackgroundFacade
  def initialize(location)
    @location = location
  end

  def geo_call
    @_geo_call ||= GeoService.new(@location)
  end

  def flickr_call
    FlickrService.new(geo_call.lat, geo_call.lon)
  end

  def photos
    flickr_call.pic_collection.map do |pic|
      Background.new(pic)
    end
  end
end
