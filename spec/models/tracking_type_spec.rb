require 'rails_helper'

RSpec.describe TrackingType, type: :model do
  let(:tracking_type) { build(:tracking_type) }

  it 'is valid' do
    expect(tracking_type).to be_valid
  end
end
