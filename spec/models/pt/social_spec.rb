require 'rails_helper'

RSpec.describe Pt::Social, type: :model do
  let(:social) { build(:social) }

  it 'is valid' do
    expect(social).to be_valid
  end
end
