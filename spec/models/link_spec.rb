require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) { build(:link) }

  it 'is valid' do
    expect(link).to be_valid
  end
end
