require 'rails_helper'

RSpec.describe Province, type: :model do
  let(:province) { build(:province) }

  it 'is valid' do
    expect(province).to be_valid
  end
end
