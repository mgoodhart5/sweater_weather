require 'rails_helper'

describe Favorite do
  describe 'Validations' do
    it {should belong_to(:user)}
  end
end
