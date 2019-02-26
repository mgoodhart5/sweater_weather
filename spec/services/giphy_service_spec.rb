require 'rails_helper'

describe GiphyService do
  it 'exists', :vcr do
    gs = GiphyService.new("Denver, Co")

    expect(gs).to be_a(GiphyService)
  end
  it 'returns a giphy that was found from the weather for that hour', :vcr do
    location = "Denver, CO"
    keyword = "snow"
    gs = GiphyService.new(location)

    expect(gs.find_the_giphys(keyword)).to be_a(Array)
    expect(gs.find_the_giphys(keyword).count).to eq(9)
    expect(gs.find_the_giphys(keyword).first).to have_key(:images)
    expect(gs.find_the_giphys(keyword).first[:images]).to have_key(:fixed_width)
    expect(gs.find_the_giphys(keyword).first[:images][:fixed_width].keys.first).to eq(:url)
  end
end
