require 'rails_helper'

RSpec.describe Manager, type: :model do
  let(:manager) { build(:manager) }

  it 'is valid' do
    expect(manager).to be_valid
  end
end
