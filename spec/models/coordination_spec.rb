require 'rails_helper'

RSpec.describe Coordination, type: :model do
  let(:coordination) { build(:coordination) }

  it 'is valid' do
    expect(coordination).to be_valid
  end
end
