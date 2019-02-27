require 'rails_helper'

describe 'favorite DELETE api' do
  it 'deletes a favorite location and returns the deleted favorite', :vcr do
    user = User.create(email: "mary@m.com", password: "pw", password_confirmation: "pw")
    post "/api/v1/users?email=#{user.email}&password=#{user.password}&password_confirmation=#{user.password}"
    expect(response).to be_successful
    answer = JSON.parse(response.body)["data"]
    expect(answer["attributes"]).to have_key("api_key")
    api_key = answer["attributes"]["api_key"]
    location_1 = "Denver, Co"
    post "/api/v1/favorites?location=#{location_1}&api_key=#{api_key}"
    location_2 = "Montrose, Co"
    post "/api/v1/favorites?location=#{location_2}&api_key=#{api_key}"
    delete "/api/v1/favorites?location=#{location_1}&api_key=#{api_key}"

    expect(response).to be_successful
    results = JSON.parse(response.body)
    expect(results.count).to eq(1)
  end
  it 'cannot delete a favorite location without an api key', :vcr do
    user = User.create(email: "mary@m.com", password: "pw", password_confirmation: "pw")
    post "/api/v1/users?email=#{user.email}&password=#{user.password}&password_confirmation=#{user.password}"
    expect(response).to be_successful
    answer = JSON.parse(response.body)["data"]
    expect(answer["attributes"]).to have_key("api_key")
    api_key = answer["attributes"]["api_key"]
    location_1 = "Denver, Co"
    post "/api/v1/favorites?location=#{location_1}&api_key=#{api_key}"
    location_2 = "Montrose, Co"
    post "/api/v1/favorites?location=#{location_2}&api_key=#{api_key}"
    delete "/api/v1/favorites?location=#{location_1}"

    expect(response).to_not be_successful
    expect(response.body).to eq("You need an API key!!")
  end
end
