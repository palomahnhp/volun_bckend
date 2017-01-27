require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { build(:event) }

  it 'is valid' do
    expect(event).to be_valid
  end
end
