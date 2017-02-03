require 'rails_helper'

RSpec.describe UnsubscribeLevel, type: :model do
  let(:unsubscribe_level) { build(:unsubscribe_level) }

  it 'is valid' do
    expect(unsubscribe_level).to be_valid
  end
end
