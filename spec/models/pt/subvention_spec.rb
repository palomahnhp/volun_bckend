require 'rails_helper'

RSpec.describe Pt::Subvention, type: :model do
  let(:subvention) { build(:subvention) }

  it 'is valid' do
    expect(subvention).to be_valid
  end
end
