class GiphyFacade

  def initialize(location)
    @location = location
  end

  def geo_call
    @_geo_call ||= GeoService.new(@location)
  end

  def forecast_call
    DarkSkyService.new(geo_call.lat, geo_call.lon)
  end

  def giphy_call
    GiphyService.new(@location)
  end

  def all_giphys
    giphy_call
  end
end
