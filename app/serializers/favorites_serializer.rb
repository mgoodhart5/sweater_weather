class FavoritesSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :location,
             :current_weather
end
