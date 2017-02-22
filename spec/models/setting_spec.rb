require 'rails_helper'

RSpec.describe Setting, type: :model do
  let(:setting) { build(:setting) }

  it 'is valid' do
    expect(setting).to be_valid
  end
end
