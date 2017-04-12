require 'rails_helper'

RSpec.describe Resource, type: :model do
  let(:resource) { build(:resource) }

  it 'is valid' do
    expect(resource).to be_valid
  end
end
