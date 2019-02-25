require 'rails_helper'

describe Giphy do
  it 'exists' do
    g = Giphy.new(attributes)

    expect(g).to be_a(Giphy)
  end
end
