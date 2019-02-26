require 'rails_helper'

describe 'user sessions API' do
  it 'sends an email and password and returns an api_key', :vcr do
    User.create(email: "m@gmail.com", password: "123", password_confirmation: "123")
    email = "m@gmail.com"
    password = 123
    post "/api/v1/sessions?email=#{email}&password=#{password}"

    expect(response).to be_successful
    answer = JSON.parse(response.body)
    expect(answer).to be_a(Hash)
    expect(answer["data"]).to have_key("attributes")
    expect(answer["data"]).to have_key("type")
    expect(answer["data"]["attributes"]).to have_key("api_key")
  end
end
