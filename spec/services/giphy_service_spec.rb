require 'rails_helper'

describe GiphyService do
  it 'exists', :vcr do
    gs = GiphyService.new("Denver, Co")

    expect(gs).to be_a(GiphyService)
  end
  it 'returns a giphy that was found from the weather for that hour', :vcr do
    location = "Denver, CO"
    gs = GiphyService.new(location)

    expect(gs.giphy_info).to be_a(Array)
    binding.pry
    expect(gs.giphy_info.first).to have_key(:images)
    expect(gs.giphy_info.first[:images]).to have_key(:fixed_width)
    expect(gs.giphy_info.first[:images][:fixed_width].keys.first).to eq(:url)
  end
end
