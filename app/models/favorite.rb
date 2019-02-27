class Favorite < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :location, scope: :user

  def self.current_weather
    Favorite.all.map do |fav|
      fav.update(current_weather: DarkSkyService.new(fav.location).weather_info[:currently])
    end
    Favorite.all
  end

end
