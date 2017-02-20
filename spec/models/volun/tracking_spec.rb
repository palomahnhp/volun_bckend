require 'rails_helper'

RSpec.describe Volun::Tracking, type: :model do
  let(:tracking) { build(:volun_tracking) }

  it 'is valid' do
    expect(tracking).to be_valid
  end
end
