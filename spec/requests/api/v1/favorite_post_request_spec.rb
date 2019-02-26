require 'rails_helper'

describe 'favorite post api' do
  it 'posts city and api to return weather', :vcr do
    email = "mary@gmail.com"
    password = 123
    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"

    expect(response).to be_successful
    answer = JSON.parse(response.body)["data"]
    expect(answer["attributes"]).to have_key("api_key")
    api_key = answer["attributes"]["api_key"]
    location = "Denver, Co"
    post "/api/v1/favorites?location=#{location}&api_key=#{api_key}"

    expect(response).to be_successful

    email = "mary@gmail.com"
    password = 123
    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"

    expect(response).to be_successful
    answer = JSON.parse(response.body)["data"]
    expect(answer["attributes"]).to have_key("api_key")
    api_key = answer["attributes"]["api_key"]
    location = "Denver, Co"
    post "/api/v1/favorites?location=#{location}"

    expect(response).to_not be_successful
    expect(status).to eq(401)
  end
end
