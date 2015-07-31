RSpec.describe Spree::PageCategory, type: :model do

  let!(:category){create(:page_category)}

  context 'factory' do
    it 'is valid' do
      expect(category).to be_valid
    end
  end

  context 'validations' do
    it{is_expected.to validate_presence_of(:name)}
    it{is_expected.to validate_uniqueness_of(:name)}
    it{is_expected.to have_many(:pages)}
  end

end