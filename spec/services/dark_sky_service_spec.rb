require 'rails_helper'

describe DarkSkyService do
  it 'exists' do
    dss = DarkSkyService.new(39.7392358, -104.990251)

    expect(dss).to be_a(DarkSkyService)
  end
  it 'gets lat and lon from geo service' do
    location = "Denver, CO"
    gs = GeoService.new(location)

    dss = DarkSkyService.new(gs.lat, gs.lon)

    expect(dss.lat).to eq(39.7392358)
    expect(dss.lon).to eq(-104.990251)
  end
end
