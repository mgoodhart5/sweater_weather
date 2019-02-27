require 'rails_helper'

describe DarkSkyService do
  it 'exists', :vcr do
    location = "Denver, CO"
    dss = DarkSkyService.new(location)

    expect(dss).to be_a(DarkSkyService)
  end
  it 'gets lat and lon from geo service', :vcr do
    location = "Denver, CO"
    dss = DarkSkyService.new(location)

    expect(dss.lat).to eq(39.7392358)
    expect(dss.lon).to eq(-104.990251)
  end
  it 'gets hashes of weather information', :vcr do
    location = "Denver, CO"
    dss = DarkSkyService.new(location)

    expect(dss.weather_info).to be_a(Hash)
    expect(dss.weather_info).to have_key(:currently)
    expect(dss.weather_info).to have_key(:timezone)
    expect(dss.weather_info[:currently]).to have_key(:summary)
    expect(dss.weather_info[:currently]).to have_key(:icon)
    expect(dss.weather_info[:currently]).to have_key(:time)
    expect(dss.weather_info[:currently]).to have_key(:temperature)
    expect(dss.weather_info[:currently]).to have_key(:apparentTemperature)
    expect(dss.weather_info[:currently]).to have_key(:humidity)
    expect(dss.weather_info[:currently]).to have_key(:visibility)
    expect(dss.weather_info[:currently]).to have_key(:uvIndex)

    expect(dss.weather_info).to have_key(:daily)
    expect(dss.weather_info[:daily]).to have_key(:summary)
    expect(dss.weather_info[:daily]).to have_key(:data)
    expect(dss.weather_info[:daily][:data].first).to have_key(:icon)
    expect(dss.weather_info[:daily][:data].first).to have_key(:precipProbability)
    expect(dss.weather_info[:daily][:data].first).to have_key(:precipType)
    expect(dss.weather_info[:daily][:data].first).to have_key(:temperatureHigh)
    expect(dss.weather_info[:daily][:data].first).to have_key(:temperatureLow)
    expect(dss.weather_info[:daily][:data].last).to have_key(:summary)

    expect(dss.weather_info).to have_key(:hourly)
    expect(dss.weather_info[:hourly]).to have_key(:data)
    expect(dss.weather_info[:hourly][:data].first).to have_key(:time)
    expect(dss.weather_info[:hourly][:data].first).to have_key(:temperature)
    expect(dss.weather_info[:hourly][:data].first).to have_key(:icon)
  end
end
