require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:activity) { build(:activity) }

  it 'is valid' do
    expect(activity).to be_valid
  end
end
