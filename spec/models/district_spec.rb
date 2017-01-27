require 'rails_helper'

RSpec.describe District, type: :model do
  let(:district) { build(:district) }

  it 'is valid' do
    expect(district).to be_valid
  end
end
