require 'rails_helper'

RSpec.describe Collective, type: :model do
  let(:collective) { build(:collective) }

  it 'is valid' do
    expect(collective).to be_valid
  end
end
