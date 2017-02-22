require 'rails_helper'

RSpec.describe EntityType, type: :model do
  let(:entity_type) { build(:entity_type) }

  it 'is valid' do
    expect(entity_type).to be_valid
  end
end
