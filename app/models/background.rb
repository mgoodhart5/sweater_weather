class Background
  attr_reader :id,
              :title,
              :secret,
              :server,
              :farm,
              :source_url
  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @secret = attributes[:secret]
    @server_id = attributes[:server]
    @farm_id = attributes[:farm]
    @source_url = photo_url
  end

  def photo_url
    "https://farm#{@farm_id}.staticflickr.com/#{@server_id}/#{@id}_#{@secret}_b.jpg"
  end
end
