require 'rails_helper'

RSpec.describe ActionType, type: :model do
  let(:action_type) { build(:action_type) }

  it 'is valid' do
    expect(action_type).to be_valid
  end
end
