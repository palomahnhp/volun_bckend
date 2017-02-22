require 'rails_helper'

RSpec.describe UnsubscribeReason, type: :model do
  let(:unsubscribe_reason) { build(:unsubscribe_reason) }

  it 'is valid' do
    expect(unsubscribe_reason).to be_valid
  end
end
