require 'rails_helper'

RSpec.describe Borough, type: :model do
  let(:borough) { build(:borough) }

  it 'is valid' do
    expect(borough).to be_valid
  end
end
