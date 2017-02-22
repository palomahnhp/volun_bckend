require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { build(:role) }

  it 'is valid' do
    expect(role).to be_valid
  end
end
