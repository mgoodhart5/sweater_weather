require 'rails_helper'

describe GiphyService do
  it 'exists', :vcr do
    gs = GiphyService.new("Denver, Co")

    expect(gs).to be_a(GiphyService)
  end
  it 'returns a hash of giphys', :vcr do
    location = "Denver, CO"
    gs = GiphyService.new(location)

  end
end
