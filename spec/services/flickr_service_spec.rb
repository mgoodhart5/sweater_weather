require 'rails_helper'

describe FlickrService do
  it 'exists', :vcr do
    fs = FlickrService.new(39.7392358, -104.990251)

    expect(fs).to be_a(FlickrService)
  end
end
