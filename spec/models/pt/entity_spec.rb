require 'rails_helper'

RSpec.describe Pt::Entity, type: :model do
  let(:entity) { build(:entity) }

  it 'is valid' do
    expect(entity).to be_valid
  end
end
