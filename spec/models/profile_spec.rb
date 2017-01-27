require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile) { build(:profile) }

  it 'is valid' do
    expect(profile).to be_valid
  end
end
