require 'rails_helper'

describe GeoService do
  it 'exists', :vcr do
    gs = GeoService.new("Denver, Co")

    expect(gs).to be_a(GeoService)
  end
  it 'returns lat and lng for location', :vcr do
    location = "Denver, CO"
    gs = GeoService.new(location)

    expect(gs.lat).to eq(39.7392358)
    expect(gs.lon).to eq(-104.990251)
  end
end
