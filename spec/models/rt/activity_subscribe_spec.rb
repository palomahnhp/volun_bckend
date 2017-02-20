require 'rails_helper'

RSpec.describe Rt::ActivitySubscribe, type: :model do
  let(:activity_subscribe) { build(:activity_subscribe) }

  it 'is valid' do
    expect(activity_subscribe).to be_valid
  end
end
