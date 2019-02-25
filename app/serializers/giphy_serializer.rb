class GiphySerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :time,
             :summary,
             :url
end
