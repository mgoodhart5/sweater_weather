require 'rails_helper'

describe DailyWeather do
  it 'exists', :vcr do
    attributes = ({icon: "icon",
                   time: 1551015700,
                   temperatureHigh: 40.2,
                   temperatureLow: 40.2,
                   precipProbability: 30,
                   precipType: "snow"
                   })
    dw = DailyWeather.new(attributes)

    expect(dw).to be_a(DailyWeather)
    expect(Time.at(dw.day).strftime("%A")).to eq("Sunday")
    expect(dw.icon).to eq(attributes[:icon])
    expect(dw.temperature_high).to eq(attributes[:temperatureHigh])
    expect(dw.temperature_low).to eq(attributes[:temperatureLow])
    expect(dw.precip_probability).to eq(attributes[:precipProbability])
    expect(dw.precip_type).to eq(attributes[:precipType])
  end
end
