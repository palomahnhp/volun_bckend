require 'rails_helper'

RSpec.describe Permission, type: :model do
  let(:permission) { build(:permission) }

  it 'is valid' do
    expect(permission).to be_valid
  end
end
