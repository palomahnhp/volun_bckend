require 'rails_helper'

RSpec.describe Req::RejectionType, type: :model do
  let(:rejection_type) { build(:rejection_type) }

  it 'is valid' do
    expect(rejection_type).to be_valid
  end
end
