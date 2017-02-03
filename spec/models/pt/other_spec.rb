require 'rails_helper'

RSpec.describe Pt::Other, type: :model do
  let(:other) { build(:other) }

  it 'is valid' do
    expect(other).to be_valid
  end
end
