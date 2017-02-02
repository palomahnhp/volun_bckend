require 'rails_helper'

RSpec.describe Area, type: :model do
  let(:area) { build(:area) }

  it 'is valid' do
    expect(area).to be_valid
  end
end
