require 'rails_helper'

describe 'user post API' do
  it 'sends an email and password', :vcr do
    email = "mary@gmail.com"
    password = 123
    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"

    expect(response).to be_successful
    answer = JSON.parse(response.body)["data"]
    expect(answer).to have_key("attributes")
    expect(answer).to have_key("type")
    expect(answer["attributes"]).to have_key("api_key")
  end
end
