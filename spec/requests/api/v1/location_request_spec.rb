require 'rails_helper'

describe "Location API" do
  it "sends a location", :vcr do
    location = create(:location)

    get "/api/v1/forecast?location=#{location["city"]},#{location["state"]}"

    expect(response).to be_successful
    answer = JSON.parse(response.body)["data"]["attributes"]

    expect(answer).to be_a(Hash)
    expect(answer).to have_key("current_weather")
    expect(answer).to have_key("current_weather_details")
    expect(answer).to have_key("hourly_weather")
    expect(answer).to have_key("daily_weather")
  end
end
