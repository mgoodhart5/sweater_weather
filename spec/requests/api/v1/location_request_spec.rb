require 'rails_helper'

describe "Location API" do
  it "sends a location" do
    location= create(:location)

    get "/api/v1/forecast?location=#{location["city"]},#{location["state"]}"

    expect(response).to be_successful
  end
end
