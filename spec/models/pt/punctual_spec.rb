require 'rails_helper'

RSpec.describe Pt::Punctual, type: :model do
  let(:punctual) { build(:punctual) }

  it 'is valid' do
    expect(punctual).to be_valid
  end
end
