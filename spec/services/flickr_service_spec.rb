require 'rails_helper'

describe FlickrService do
  it 'exists', :vcr do
    fs = FlickrService.new(39.7392358, -104.990251)

    expect(fs).to be_a(FlickrService)
  end
  it 'returns a a hash of photo information', :vcr do
    fs = FlickrService.new(39.7392358, -104.990251)

    expect(fs.photo_info).to be_a(Array)
    expect(fs.photo_info.count).to eq(25)
    expect(fs.photo_info.first).to have_key(:farm)
    expect(fs.photo_info.first).to have_key(:server)
    expect(fs.photo_info.first).to have_key(:id)
    expect(fs.photo_info.first).to have_key(:secret)
    expect(fs.photo_info.first).to have_key(:title)
  end
end
