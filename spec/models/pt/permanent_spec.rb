require 'rails_helper'

RSpec.describe Pt::Permanent, type: :model do
  let(:permanent) { build(:permanent) }

  it 'is valid' do
    expect(permanent).to be_valid
  end
end
