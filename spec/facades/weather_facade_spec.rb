require 'rails_helper'

describe WeatherFacade do
  it 'exists', :vcr do
    location = "Denver, CO"
    wf = WeatherFacade.new(location)

    expect(wf).to be_a(WeatherFacade)
  end
  it 'returns a forcast object', :vcr do
    location = "Denver, CO"
    wf = WeatherFacade.new(location)
    answer = wf.forecast

    expect(answer).to be_a(Weather)
  end
end
