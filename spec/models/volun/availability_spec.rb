require 'rails_helper'

RSpec.describe Volun::Availability, type: :model do
  let(:availability) { build(:availability) }

  it 'is valid' do
    expect(availability).to be_valid
  end
end
