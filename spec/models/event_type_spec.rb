require 'rails_helper'

RSpec.describe EventType, type: :model do
  let(:event_type) { build(:event_type) }

  it 'is valid' do
    expect(event_type).to be_valid
  end
end
