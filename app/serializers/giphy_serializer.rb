class GiphySerializer
  include FastJsonapi::ObjectSerializer
  attributes :time,
             :summary,
             :url
end
