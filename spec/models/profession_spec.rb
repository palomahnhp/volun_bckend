require 'rails_helper'

RSpec.describe Profession, type: :model do
  let(:profession) { build(:profession) }

  it 'is valid' do
    expect(profession).to be_valid
  end
end
