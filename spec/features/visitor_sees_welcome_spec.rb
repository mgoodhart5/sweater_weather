require 'rails_helper'

describe 'as a visitor when i visit /' do
  it 'sees bienvenido a sweater weather!' do
    visit root_path

    expect(page).to have_content("Bienvenido a Sweater Weather")
  end
end
