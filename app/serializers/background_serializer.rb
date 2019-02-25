class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :source_url
end
