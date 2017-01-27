require 'rails_helper'

RSpec.describe Ent::Tracking, type: :model do
  let(:tracking) { build(:ent_tracking) }

  it 'is valid' do
    expect(tracking).to be_valid
  end
end
