require 'rails_helper'

describe "Location API" do
  it "sends a location", :vcr do
    location = create(:location)

    get "/api/v1/forecast?location=#{location["city"]},#{location["state"]}"

    expect(response).to be_successful
    answer = JSON.parse(response.body)["data"]["attributes"]

    expect(answer).to be_a(Hash)
  end
end
