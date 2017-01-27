require 'rails_helper'

RSpec.describe Volunteer, type: :model do
  let(:volunteer) { build(:volunteer) }

  it 'is valid' do
    expect(volunteer).to be_valid
  end
end
