require 'rails_helper'

RSpec.describe DegreesVolunteer, type: :model do
  let(:degrees_volunteer) { build(:degrees_volunteer) }

  it 'is valid' do
    expect(degrees_volunteer).to be_valid
  end
end
