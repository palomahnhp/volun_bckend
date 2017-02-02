require 'rails_helper'

RSpec.describe RequestReason, type: :model do
  let(:request_reason) { build(:request_reason) }

  it 'is valid' do
    expect(request_reason).to be_valid
  end
end
