require 'rails_helper'

RSpec.describe Sector, type: :model do
  let(:sector) { build(:sector) }

  it 'is valid' do
    expect(sector).to be_valid
  end
end
