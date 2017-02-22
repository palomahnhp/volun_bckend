require 'rails_helper'

RSpec.describe Pro::Tracking, type: :model do
  let(:tracking) { build(:pro_tracking) }

  it 'is valid' do
    expect(tracking).to be_valid
  end
end
