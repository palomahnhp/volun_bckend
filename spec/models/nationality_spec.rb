require 'rails_helper'

RSpec.describe Nationality, type: :model do
  let(:nationality) { build(:nationality) }

  it 'is valid' do
    expect(nationality).to be_valid
  end
end
