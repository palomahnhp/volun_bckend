require 'rails_helper'

RSpec.describe Volun::Assessment, type: :model do
  let(:assessment) { build(:assessment) }

  it 'is valid' do
    expect(assessment).to be_valid
  end
end
