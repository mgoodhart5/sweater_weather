require 'rails_helper'

describe 'favorite get api' do
  it 'returns favorites and their current_weather', :vcr do
    user = User.create(email: "mary@m.com", password: "pw", password_confirmation: "pw")
    post "/api/v1/users?email=#{user.email}&password=#{user.password}&password_confirmation=#{user.password}"
    expect(response).to be_successful
    answer = JSON.parse(response.body)["data"]
    expect(answer["attributes"]).to have_key("api_key")
    api_key = answer["attributes"]["api_key"]
    location = "Denver, Co"
    post "/api/v1/favorites?location=#{location}&api_key=#{api_key}"
    location = "Montrose, Co"
    post "/api/v1/favorites?location=#{location}&api_key=#{api_key}"
    get "/api/v1/favorites?api_key=#{api_key}"

    expect(response).to be_successful
    results = JSON.parse(response.body)
    expect(results["data"].count).to eq(2)
    expect(results["data"].first).to have_key("attributes")
    expect(results["data"].first["attributes"]).to have_key("location")
    expect(results["data"].first["attributes"]).to have_key("current_weather")
    expect(results["data"].first["attributes"]["current_weather"]).to have_key("summary")
  end
end
