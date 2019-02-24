require 'rails_helper'

describe 'Background API' do
  it 'returns a photo', :vcr do
    location = create(:location)

    get "/api/v1/backgrounds?location=#{location["city"]},#{location["state"]}"

    expect(response).to be_successful
    answer = JSON.parse(response.body)["data"]
    expect(answer).to be_a(Array)
    expect(answer[0]).to have_key("id")
    expect(answer[0]).to have_key("type")
    expect(answer[0]).to have_key("attributes")
    expect(answer[0]["attributes"]).to have_key("source_url")
  end
end
