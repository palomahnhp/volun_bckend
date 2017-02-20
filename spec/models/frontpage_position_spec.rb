require 'rails_helper'

RSpec.describe FrontpagePosition, type: :model do
  let(:frontpage_position) { build(:frontpage_position) }

  it 'is valid' do
    expect(frontpage_position).to be_valid
  end
end
