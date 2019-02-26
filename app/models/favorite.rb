class Favorite < ApplicationRecord
  belongs_to :user

  def self.current_weather
    Favorite.all.map do |fav|
      gs = GeoService.new(fav.location)
      fav.update(current_weather: DarkSkyService.new(gs.lat, gs.lon).weather_info[:currently])
    end
    Favorite.all
  end

end
