require 'rails_helper'

describe GeoService do
  it 'exists' do
    gs = GeoService.new("Denver, Co")

    expect(gs).to be_a(GeoService)
  end
end
