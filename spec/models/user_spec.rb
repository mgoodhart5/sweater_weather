describe User, type: :model do
  describe 'Validations' do
    it {should have_many(:favorites)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
  end
end
