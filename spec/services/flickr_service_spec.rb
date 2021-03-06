require 'rails_helper'

describe FlickrService do
  it 'exists', :vcr do
    fs = FlickrService.new(39.7392358, -104.990251)

    expect(fs).to be_a(FlickrService)
  end
  it 'returns a hash of photo information', :vcr do
    fs = FlickrService.new(39.7392358, -104.990251)

    expect(fs.photo_info).to be_a(Array)
    expect(fs.photo_info.count).to eq(5)
    expect(fs.photo_info.first).to have_key(:farm)
    expect(fs.photo_info.first).to have_key(:server)
    expect(fs.photo_info.first).to have_key(:id)
    expect(fs.photo_info.first).to have_key(:secret)
    expect(fs.photo_info.first).to have_key(:title)
  end
  it 'returns a single photo hash, count of 5', :vcr do
    fs_1 = FlickrService.new(39.7392358, -104.990251)

    expect(fs_1.pic_collection).to be_a(Array)
    expect(fs_1.pic_collection.count).to eq(5)
  end
end
