require 'rails_helper'

describe Background do
  it 'exists', :vcr do
    attributes = ({id: "icon",
                   title: "boring photo",
                   secret: "secret",
                   server: 123,
                   farm: 30
                   })
    b = Background.new(attributes)

    expect(b).to be_a(Background)
    expect(b.id).to eq(attributes[:id])
    expect(b.title).to eq(attributes[:title])
    expect(b.secret).to eq(attributes[:secret])
    expect(b.server_id).to eq(attributes[:server])
    expect(b.farm_id).to eq(attributes[:farm])
  end
end
