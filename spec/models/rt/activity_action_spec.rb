require 'rails_helper'

RSpec.describe Rt::ActivityAction, type: :model do
  let(:activity_action) { build(:activity_action) }

  it 'is valid' do
    expect(activity_action).to be_valid
  end
end
