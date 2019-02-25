require 'rails_helper'

describe Giphy do
  it 'exists' do
    g = Giphy.new(attributes)

    expect(g).to be_a(Giphy)
  end
  it 'is instantiated with a url, time, summary' do
    url = "giphyurl.com"
    time = "089493021"
    summary = "Mostly Sunny"
    g = Giphy.new(url)

    expect(g.url).to eq(url)
    expect(g.time).to eq(time)
    expect(g.summary).to eq(summary)
  end
end
