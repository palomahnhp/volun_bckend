require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { build(:address) }

  it 'is valid' do
    expect(address).to be_valid
  end
end
