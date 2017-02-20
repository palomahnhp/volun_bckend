require 'rails_helper'

RSpec.describe Trait, type: :model do
  let(:trait) { build(:trait) }

  it 'is valid' do
    expect(trait).to be_valid
  end
end
