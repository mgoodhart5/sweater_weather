require 'rails_helper'

describe 'gifs api' do
  it 'returns the summary, time and giphy url', :vcr do
    location = create(:location)

    get "/api/v1/gifs?location=#{location["city"]},#{location["state"]}"

    expect(response).to be_successful
    answer = JSON.parse(response.body)
    expect(answer).to be_a(Array)
  end
end
