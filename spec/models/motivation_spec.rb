require 'rails_helper'

RSpec.describe Motivation, type: :model do
  let(:motivation) { build(:motivation) }

  it 'is valid' do
    expect(motivation).to be_valid
  end
end
