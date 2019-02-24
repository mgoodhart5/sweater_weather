require 'rails_helper'

describe HourlyWeather do
  it 'exists', :vcr do
    attributes = ({icon: "icon", time: 1551015700, temperature: 40.2})
    hw = HourlyWeather.new(attributes)

    expect(hw).to be_a(HourlyWeather)
    expect(hw.time).to eq(Time.at(attributes[:time]).strftime("%l %P"))
    expect(hw.icon).to eq(attributes[:icon])
    expect(hw.temperature).to eq(attributes[:temperature])
  end
end
